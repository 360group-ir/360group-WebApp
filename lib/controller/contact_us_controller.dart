import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/controller/Models/contact_us_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


class ContactUsController extends GetxController {
  final Dio _dio = Dio();
  final String _baseUrl = "https://360tools.io/epelak/api/contact-us";

  var isLoading = false.obs;
  var isSuccess = false.obs;
  var errorMessage = "".obs;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  Future<void> sendContactUs() async {
    isLoading.value = true;
    isSuccess.value = false;
    errorMessage.value = "";

    try {
      final contactUsModel = ContactUsModel(
        email: emailController.text,
        mobile: mobileController.text,
        content: contentController.text,
      );

      final response = await _dio.post(
        _baseUrl,
        data: contactUsModel.toJson(),
      );

      if (response.statusCode == 200 && response.data['status'] == true) {
        isSuccess.value = true;
        Get.snackbar("ثبت شد",
            "فرم شما با موفقیت ثبت و شد منتظر ارتباط کارشناسان ما بمانید .",
            borderRadius: 8,
            icon: const Icon(
              CupertinoIcons.check_mark,
              color: Colors.white,
            ),
            backgroundColor: Colors.green[400]);
      } else {
        errorMessage.value = response.data['message'] ?? 'Unknown error';
        Get.snackbar("ثبت شد", errorMessage.toString(),
            borderRadius: 8,
            colorText: Colors.white,
            messageText: Text(
              errorMessage.toString(),
              style: AppTextStyles.snackbar,
            ),
            icon: const Icon(
              CupertinoIcons.check_mark,
              color: Colors.white,
            ),
            backgroundColor: Colors.green[400]);
      }
    } catch (e) {
      errorMessage.value = e.toString();
      print(errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/req_form_textFeild.dart';

class SendReqForm extends StatefulWidget {
  const SendReqForm({
    super.key,
    required this.uploadResume,
    required this.color,
  });

  final bool uploadResume;
  final Color color;

  @override
  State<SendReqForm> createState() => _SendReqFormState();
}

class _SendReqFormState extends State<SendReqForm> {
  String? selectedFileName; // برای ذخیره نام فایل انتخاب شده

  Future<void> _pickFile() async {
    // انتخاب فایل با File Picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );

    if (result != null) {
      setState(() {
        selectedFileName = result.files.single.name; // نمایش نام فایل
      });
      Get.snackbar(
        "فایل اپلود شد ",
        result.files.single.name,
        backgroundColor: AppColors.neutralLight,
        duration: const Duration(seconds: 4),
      );
      // مسیر فایل: result.files.single.path
      //TODO:
      print('File Selected: ${result.files.single.name}');
    } else {
      print('No file selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.padding, vertical: AppDimens.small),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.sendReq,
                style: AppTextStyles.descriptionTitleStyle,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          // Form Fields
          const ReqFormTextfeild(
            hintText: 'نام و نام خانوادگی ',
            maxLin: 1,
            keyboardType: TextInputType.name,
          ),
          const ReqFormTextfeild(
            hintText: ' شماره موبایل ',
            maxLin: 1,
            keyboardType: TextInputType.number,
          ),
          const ReqFormTextfeild(
            hintText: 'متن درخواست  ',
            maxLin: 6,
            keyboardType: TextInputType.text,
          ),
          AppDimens.padding.height,
          // Upload Button
          if (widget.uploadResume)
            GestureDetector(
              onTap: _pickFile,
              child: Center(
                child: Container(
                  height: 40,
                  width: 137,
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.shadowColor2,
                          offset: Offset(0, 2),
                          blurRadius: 4,
                        ),
                        BoxShadow(
                          color: AppColors.shadowColor1,
                          offset: Offset(0, 1),
                          blurRadius: 4,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: selectedFileName == null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              AppText.upload,
                              style: AppTextStyles.tileChildrenStyle,
                              overflow: TextOverflow.fade,
                            ),
                            AppDimens.medium.width,
                            SvgPicture.asset(Assets.svg.upload)
                          ],
                        )
                      : const Icon(
                          CupertinoIcons.checkmark,
                          color: Colors.green,
                          weight: 28,
                        ),
                ),
              ),
            ),
          (AppDimens.padding * 2).height,
          // Submit Button
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: AppDimens.medium),
            decoration: BoxDecoration(
                color: widget.color, borderRadius: BorderRadius.circular(4)),
            child: TextButton(
              onPressed: () {
                // TODO: ارسال اطلاعات و فایل به سرور
                Get.snackbar(
                  'فرم ثبت شد',
                  'فرم شما ثبت و ارسال شد همکاران ما در اسرع وقت با شما تماس حاصل میکنند',
                  backgroundColor: AppColors.neutralLight,
                  duration: const Duration(seconds: 4),
                );
                print('Form Submitted');
              },
              child: Text(
                AppText.send,
                style: AppTextStyles.landingPage.copyWith(fontSize: 16),
              ),
            ),
          ),
          AppDimens.small.height,
        ],
      ),
    );
  }
}

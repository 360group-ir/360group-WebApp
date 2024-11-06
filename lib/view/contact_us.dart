import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/send_req_form.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
    required this.maincolor,
  });

  final Color maincolor;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height*0.085),
                child: Container(
                  height: size.height*0.085,
                  color: maincolor,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppDimens.padding.width,
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: SvgPicture.asset(Assets.svg.group)),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        Assets.svg.groper360,
                        height: size.height*0.0343,
                      ),
                      AppDimens.padding.width,
                    ],
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppDimens.xlarge.height,

                  // send req 2
                  AppDimens.xlarge.height,
                   SendReqForm(color: maincolor,
                    uploadResume: false,
                  ),
                  (size.height * 0.11).height,

                  Footer(color: maincolor, logoPath: Assets.svg.groper360),
                ],
              ),
            )));
  }
}

import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/app_text.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/component/responsive.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:Group360/widgets/drawer.dart';
import 'package:Group360/widgets/send_req_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class ContactUs extends StatelessWidget {
  const ContactUs({
    super.key,
    required this.maincolor,
    this.uploadResume = false,
  });

  final Color maincolor;
  final bool uploadResume;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            drawer: CustomDrawer(
              partColor: maincolor,
              logo: 0,
            ),
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.08),
                child: Container(
                  height: size.height * 0.08,
                  color: maincolor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              CupertinoIcons.left_chevron,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              showFullScreenDrawer(context, maincolor, 0);
                            },
                            icon: SvgPicture.asset(Assets.svg.group)),
                      ],
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    AppDimens.xlarge.height,
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth:
                              Responsive.isDesktop(context) ? 1080 : size.width),
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                AppText.aboutUsT,
                                style: AppTextStyles.titleStyle,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.justify,
                              ),
                            ),
                          ),
                          // send req 2
                          AppDimens.xlarge.height,
                          SendReqForm(
                            color: maincolor,
                            uploadResume: uploadResume,
                          ),
                        ],
                      ),
                    ),
                    (size.height * 0.12).height,
                  ],
                ),
              ),
            )));
  }
}

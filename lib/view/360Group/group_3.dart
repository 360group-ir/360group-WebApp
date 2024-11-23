import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/landing_page.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/requierment_widget.dart';
import 'package:service_360/widgets/send_req_form.dart';

class Group3 extends StatelessWidget {
  const Group3({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.08),
                child: Container(
                  height: size.height * 0.08,
                  color: AppColors.primaryDefaultG,
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
                        GestureDetector(
                          onTap: () => Get.to(const LandingPage()),
                          child: SvgPicture.asset(
                            Assets.svg.groper360,
                            height: size.height * 0.0343,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.svg.group)),
                      ],
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  AppDimens.xlarge.height,
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimens.padding),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppText.front,
                        style: AppTextStyles.titleStyle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),

                  AppDimens.xlarge.height,

                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimens.padding),
                    child: Text(
                      AppText.frontdesc,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.descriptionStyle,
                    ),
                  ),
                  AppDimens.xlarge.height,
                  // requirment 1
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(AppDimens.medium),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppText.requierd,
                              style: AppTextStyles.descriptionTitleStyle,
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                        RequiermentList(items: frontItems,),
                      ],
                    ),
                  ),
                  // send req 2
                  AppDimens.xlarge.height,
                  const SendReqForm(
                    color: AppColors.primaryDefaultG,
                    uploadResume: true,
                  ),
                  AppDimens.large.height,
                  Footer(
                    color: AppColors.primaryDefaultG,
                    logoPath: Assets.svg.groper360,
                  ),
                ],
              ),
            )));
  }
}

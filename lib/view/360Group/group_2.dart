import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/component/responsive.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/360Group/group_3.dart';
import 'package:service_360/widgets/Expan_Gruope.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/text_button.dart';

class Group2 extends StatelessWidget {
  const Group2({super.key});

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
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.svg.group)),
                      ],
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  //Qr code groupe
                  Container(
                    color: AppColors.primaryDefaultG,
                    // height: 400,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (AppDimens.large).height,
                        SvgPicture.asset(
                          Assets.svg.groper360,
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.2
                              : size.width * 0.3,
                        ),
                        (AppDimens.large * 2).height,
                        Image.asset(
                          Assets.png.qrcode.path,
                        ),
                        (AppDimens.large).height,
                      ],
                    ),
                  ),
                  AppDimens.xlarge.height,
                  //constrainteed box
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            Responsive.isDesktop(context) ? 1080 : size.width),
                    child: Column(
                      children: [
                        //Job Offers Text
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.padding),
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              AppText.jobOfferTitle,
                              style: AppTextStyles.titleStyle,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            ),
                          ),
                        ),
                        AppDimens.xlarge.height,
                        // Job offer text
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: AppDimens.padding),
                          child: Text(
                            AppText.jobOffersdesc,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.descriptionStyle,
                          ),
                        ),
                        // Pan list
                        ExpanGroup(title: AppText.departman1, children: [
                          CostumTextButton(
                            title: 'طراح رابط کاربری',
                            onpress: () {
                              Get.to(const Group3(jobOfferTitle: "front End"));
                            },
                          ),
                          CostumTextButton(
                              title: 'طراح گرافیک',
                              onpress: () {
                                Get.to(
                                    const Group3(jobOfferTitle: "front End"));
                              }),
                          const CostumTextButton()
                        ]),
                      ],
                    ),
                  ),

                  (AppDimens.xlarge).height,

                  Footer(
                    color: AppColors.primaryDefaultG,
                    logoPath: Assets.svg.groper360,
                  ),
                ],
              ),
            )));
  }
}

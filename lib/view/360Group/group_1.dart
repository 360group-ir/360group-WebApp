import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/360Group/group_2.dart';
import 'package:service_360/widgets/Expan_Gruope.dart';
import 'package:service_360/widgets/Icon_widget.dart';

class Group1 extends StatelessWidget {
  const Group1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.1),
                child: Container(
                  color: AppColors.primaryDefaultG,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: SvgPicture.asset(Assets.svg.group)),
                      AppDimens.small.width,
                    ],
                  ),
                )),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //Qr code groupe
                  Container(
                    color: AppColors.primaryDefaultG,
                    height: 400,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.svg.groper360,
                          height: 64,
                        ),
                        (AppDimens.large * 3).height,
                        Image.asset(
                          Assets.png.qrcode.path,
                        ),
                        (AppDimens.xlarge).height
                      ],
                    ),
                  ),
                  //List tiles
                  // about us
                  const ExpanGroup(
                    title: "درباره ما ",
                    children: [
                      Text(
                        AppText.lorem,
                        style: AppTextStyles.tileChildrenStyle,
                      )
                    ],
                  ),

                  //Contact Us
                  ExpanGroup(title: 'راه‌های ارتباطی', children: [
                    AppDimens.xlarge.height,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.large),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconWidget(
                            assetsName: Assets.svg.icon,
                            text: AppText.website,
                          ),
                          IconWidget(
                            assetsName: Assets.svg.icon1,
                            text: AppText.address,
                          ),
                          IconWidget(
                            assetsName: Assets.svg.icon2,
                            text: AppText.email,
                          ),
                          IconWidget(
                            assetsName: Assets.svg.vector,
                            text: AppText.phone,
                          ),
                        ],
                      ),
                    ),
                    (AppDimens.large + 12).height,
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppDimens.large),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconWidget(
                            assetsName: Assets.svg.icon4,
                            text: AppText.insta,
                          ),
                          (AppDimens.padding * 3).width,
                          IconWidget(
                            assetsName: Assets.svg.icon3,
                            text: AppText.linkdin,
                          ),
                        ],
                      ),
                    ),
                    AppDimens.xlarge.height
                  ]),

                  // Job offers
                  ExpanGroup(title: "فرصت‌های شغلی", children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        AppText.jobOffers,
                        maxLines: 10,
                        textDirection: TextDirection.rtl,
                        style: AppTextStyles.tileChildrenStyle,
                      ),
                    ),
                    AppDimens.xlarge.height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryDefaultG,
                          borderRadius: BorderRadius.circular(4)),
                      child: TextButton(
                        onPressed: () {
                          Get.to(const Group2());
                        },
                        child: Text(
                          AppText.knowMore,
                          style:
                              AppTextStyles.landingPage.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    AppDimens.small.height
                  ]),
                  // our Team
                  const ExpanGroup(title: "تیم ما", children: []),

                  (size.height * 0.13).height,
                  //TODO: footer
                ],
              ),
            )));
  }
}
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/app_text.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/component/responsive.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:Group360/main.dart';
import 'package:Group360/widgets/Expan_Gruope.dart';
import 'package:Group360/widgets/drawer.dart';
import 'package:Group360/widgets/text_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Group2 extends StatelessWidget {
  const Group2({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            drawer: const CustomDrawer(
              partColor: AppColors.primaryDefaultG,
              logo: 0,
            ),
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
                            onPressed: () {
                              showFullScreenDrawer(
                                  context, AppColors.primaryDefaultG, 0);
                            },
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
                          Assets.svg.logo3603,
                          colorFilter: const ColorFilter.mode(
                              AppColors.neutralLight, BlendMode.srcIn),
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.2
                              : size.width * 0.40,
                        ),
                        (AppDimens.large).height,
                        QrImageView(
                          data: Uri.base.toString(),
                          version: QrVersions.auto,
                          size: size.height * 0.18,
                          dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Colors.white),
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Colors.white,
                          ),
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
                        ExpanGroup(
                            title: AppText.departman1,
                            expantileOpen: true,
                            children: [
                              CostumTextButton(
                                title: 'بازاریاب تلفنی',
                                onpress: () {
                                  Get.toNamed(
                                      '${RouteName.jobofferSingle}?jobOfferTitle=sales');
                                },
                              ),
                            ]),
                        //Button
                        AppDimens.xlarge.height,
                        ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 192),
                          child: MouseRegion(
                            cursor: SystemMouseCursors
                                .click, // نشانگر ماوس را به کلیک تغییر می‌دهد
                            child: Container(
                              height: 48,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.primaryDefaultG,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(RouteName.contactUs);
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      AppColors.primaryDefaultG, // رنگ پس‌زمینه
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  "به ما به پیوندید",
                                  style: AppTextStyles.landingPage
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  (size.height * 0.1).height,
                ],
              ),
            )));
  }
}

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
import 'package:service_360/view/360Service/service_single.dart';
import 'package:service_360/widgets/Expan_service.dart';
import 'package:service_360/widgets/footer.dart';

class ServiceMainPage extends StatelessWidget {
  const ServiceMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.neutralLight,
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.08),
          child: Container(
            height: size.height * 0.08,
            color: AppColors.primaryDefaultS,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding),
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
                  SvgPicture.asset(
                    Assets.svg.service360,
                    height: size.height * 0.0343,
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
            // 360 title
            const Padding(
              padding: EdgeInsets.fromLTRB(
                  0, AppDimens.xlarge, AppDimens.padding, 0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  AppText.serviceTitle,
                  style: AppTextStyles.titleStyle,
                  textDirection: TextDirection.rtl,
                ),
              ),
            ),
            // List view
            ListView.builder(
              shrinkWrap: true,
              itemCount: serviceTitle.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return ExpanService(
                  title: serviceTitle[index],
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(
                            ServiceSingle(
                              title: serviceTitle[index],
                              complement: serviceComplement[index],
                              importance: serviceImportance[index],
                            ),
                            transition: Transition.leftToRight,
                            fullscreenDialog: true);
                      },
                      child: SizedBox(
                          // width: size.width,
                          // height: size.width,
                          child: Image.asset(
                        Assets.png.imagePlaceH.path,
                      )),
                    ),
                    AppDimens.padding.height,
                    Text(
                      serviceDesc[index],
                      style:
                          AppTextStyles.tileChildrenStyle.copyWith(height: 2),
                      textAlign: TextAlign.justify,
                      textDirection: TextDirection.rtl,
                    ),
                    AppDimens.padding.height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryDefaultS,
                          borderRadius: BorderRadius.circular(4)),
                      child: TextButton(
                        onPressed: () {
                          Get.to(
                              ServiceSingle(
                                title: serviceTitle[index],
                                complement: serviceComplement[index],
                                importance: serviceImportance[index],
                              ),
                              transition: Transition.leftToRight,
                              fullscreenDialog: true);
                        },
                        child: Text(
                          AppText.knowMore,
                          style:
                              AppTextStyles.landingPage.copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            (size.height * 0.1).height,
            Footer(
              color: AppColors.primaryDefaultS,
              logoPath: Assets.svg.service360,
            ),
          ],
        ),
      ),
    ));
  }
}

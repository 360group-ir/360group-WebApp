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
          preferredSize: Size(size.width, size.height * 0.085),
          child: Container(
            height: size.height * 0.085,
            color: AppColors.primaryDefaultS,
            child: Row(
              children: [
                AppDimens.padding.width,
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: SvgPicture.asset(Assets.svg.group)),
                const Expanded(child: SizedBox()),
                SvgPicture.asset(
                  Assets.svg.service360,
                  height: size.height * 0.0343,
                ),
                AppDimens.padding.width,
              ],
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
                    Image.asset(Assets.png.imagePlaceH.path),
                    AppDimens.padding.height,
                    const Text(
                      AppText.lorem,
                      style: AppTextStyles.tileChildrenStyle,
                    ),
                    AppDimens.padding.height,
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColors.primaryDefaultS,
                          borderRadius: BorderRadius.circular(4)),
                      child: TextButton(
                        onPressed: () {
                          Get.to(const ServiceSingle(),
                              transition: Transition.leftToRight,
                              fullscreenDialog: true
                              );
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

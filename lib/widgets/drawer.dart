import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/360Group/group_1.dart';
import 'package:service_360/view/360Group/group_2.dart';
import 'package:service_360/view/360Service/service_main_page.dart';
import 'package:service_360/view/contact_us.dart';
import 'package:service_360/widgets/app_slider.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.partColor, required this.logo});
  final Color partColor;
  final int logo;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size(size.width, size.height * 0.08),
            child: Container(
              height: size.height * 0.08,
              color: partColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: AppDimens.padding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(
                          CupertinoIcons.left_chevron,
                          color: Colors.white,
                        )),
                  ],
                ),
              ),
            )),
        body: Container(
          color: partColor,
          height: size.height,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppDimens.small.height,
              SvgPicture.asset(
                logo==0 ? Assets.svg.logo3603 : Assets.svg.logo3607,
                width: size.height * 0.26,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('صفحه اصلی',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.offAll(const FullscreenSlider());
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('گروه ۳۶۰',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.to(const Group1());
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('خدمات ۳۶۰',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.to(const ServiceMainPage());
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('ابزار ۳۶۰',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.to(const FullscreenSlider());
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('فرصت های شغلی',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.to(const Group2());
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('ارتباط با ما',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.to(const ContactUs(
                    maincolor: AppColors.primaryDefaultG,
                  ));
                },
              ),
              (size.height * 0.04).height,
            ],
          ),
        ),
      ),
    );
  }
}

void showFullScreenDrawer(BuildContext context, Color partColor , int logo) {
  showModalBottomSheet(
    useRootNavigator: false,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    context: context,
    sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 800)),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return CustomDrawer(
        partColor: partColor,
        logo: logo,
      );
    },
    backgroundColor: Colors.transparent,
  );
}

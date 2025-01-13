import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:Group360/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                logo == 0 ? Assets.svg.logo3603 : Assets.svg.logo3607,
                width: size.height * 0.23,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('صفحه اصلی',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.offNamed(RouteName.mainScreen);
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('گروه ۳۶۰',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.toNamed(RouteName.group);
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('خدمات ۳۶۰',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.toNamed(RouteName.services);
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('ابزار ۳۶۰',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  launchUrl(Uri.parse('https://360tools.io/'));
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('فرصت های شغلی',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.toNamed(RouteName.jobOffers);
                },
              ),
              (size.height * 0.03).height,
              ListTile(
                title: const Text('ارتباط با ما',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.landingPage),
                onTap: () {
                  Get.toNamed(RouteName.contactUs);
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

void showFullScreenDrawer(BuildContext context, Color partColor, int logo) {
  showModalBottomSheet(
    useRootNavigator: false,
    constraints: const BoxConstraints(maxWidth: double.infinity),
    context: context,
    sheetAnimationStyle: AnimationStyle(
        duration: const Duration(milliseconds: 800),
        reverseDuration: const Duration(milliseconds: 800)),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SafeArea(
        child: CustomDrawer(
          partColor: partColor,
          logo: logo,
        ),
      );
    },
    backgroundColor: Colors.transparent,
  );
}

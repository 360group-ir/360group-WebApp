
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/contact_us.dart';
import 'package:service_360/view/landing_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body:  Container(
          color:
              const Color.fromARGB(255, 63, 105, 225), 
          height: size.height, 
          width: size.width, 
          child: Column(
            children: [
              (size.height * 0.05).height,
              SvgPicture.asset(
                Assets.svg.groper360,
                height: size.height * 0.25,
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
              (size.height*0.075).height,
              ListTile(
                title: const Text(
                  'صفحه اصلی',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleStyle
                ),
                onTap: () {
                  Get.offAll(LandingPage());
                },
              ),
              (size.height*0.045).height,
              ListTile(
                title: const Text(
                  'شرکت‌های مرکز رشد',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleStyle
                ),
                onTap: () {
                  Get.offAll(LandingPage());

                },
              ),
              (size.height*0.045).height,
              ListTile(
                title: const Text(
                  'ارتباط با ما',
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleStyle
                ),
                onTap: () {
                  Get.to(const ContactUs(maincolor: AppColors.primaryDefaultG,));
                },
              ),
              const Expanded(child: SizedBox()),
               Padding(
                padding: const EdgeInsets.only(bottom:  (AppDimens.xlarge*2)),
                child: SvgPicture.asset(Assets.svg.groper360 , height: size.height*0.034,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void showFullScreenDrawer(BuildContext context) {
  showModalBottomSheet(
    context: context,
    sheetAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 800),reverseDuration: const Duration(milliseconds: 800)),
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const CustomDrawer();
    },
    backgroundColor: Colors.transparent,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/widgets/app_slider.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((onValue) {
      Get.off(const FullscreenSlider());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBG2,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Center(
            child: LoadingAnimationWidget.progressiveDots(
              color: AppColors.primaryDefaultG,
              size: MediaQuery.sizeOf(context).width*0.07,
            ),
          )
            ],
          ),
        ),
      ),
    );
  }
}

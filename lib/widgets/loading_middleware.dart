import 'package:Group360/component/res/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return const RouteSettings(name: '/loader');
  }

  @override
  Widget onPageBuilt(Widget page) {
    return FutureBuilder(
      future: Future.delayed(const Duration(milliseconds: 1500)), // شبیه‌سازی بارگذاری
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return page;
        } else {
          return LoadingAnimationWidget.progressiveDots(
              color: AppColors.primaryDefaultG,
              size: MediaQuery.sizeOf(context).width*0.07,
            );
        }
      },
    );
  }
}
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/responsive.dart';
import 'package:Group360/view/360Group/group_1.dart';
import 'package:Group360/view/360Group/group_2.dart';
import 'package:Group360/view/360Group/group_3.dart';
import 'package:Group360/view/360Service/service_main_page.dart';
import 'package:Group360/view/app_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.primaryDefaultG,
      systemNavigationBarColor: AppColors.primaryDefaultG));
  runApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context)
                    // ? 1080
                    ? constraints.maxWidth
                    : Responsive.isTablet(context)
                        ? constraints.maxWidth
                        : Responsive.isMobile(context)
                            ? constraints.maxWidth
                            : 435),
            child: const MyApp(),
          ),
        );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '360 Group',
      locale: const Locale("En"),
      theme: ThemeData(
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        splashColor: AppColors.primaryDefaultG,
      ),
      defaultTransition: Transition.cupertinoDialog,
      transitionDuration: Durations.extralong2,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
            name: RouteName.mainScreen, page: () => const FullscreenSlider()),
        GetPage(name: RouteName.group, page: () => const Group1()),
        GetPage(name: RouteName.jobOffers, page: () => const Group2()),
        GetPage(name: RouteName.jobofferSingle, page: () => const Group3()),
        GetPage(name: RouteName.services, page: () => const ServiceMainPage()),
      ],
      initialRoute: RouteName.mainScreen,
    );
  }
}

class RouteName {
  RouteName._();

  static String splash = "/";
  static String mainScreen = "/mainScreen";
  static String group = "/group";
  static String jobOffers = "/jobOffer";
  static String jobofferSingle = "/jobOffer/page";
  static String contactUs = "/contactUs";
  static String services = "/services";
  static String servicesSingle = "/serviceTitle";
}

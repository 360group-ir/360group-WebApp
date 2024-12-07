import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/responsive.dart';
import 'package:get/get.dart';
import 'package:service_360/view/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor:AppColors.primaryDefaultG,
      systemNavigationBarColor:AppColors.primaryDefaultG));
  runApp(
    LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context)
                    // ? 1080
                    ?constraints.maxWidth
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
      transitionDuration: Durations.extralong4,
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
    );
  }
}

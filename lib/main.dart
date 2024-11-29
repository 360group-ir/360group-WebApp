import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_360/component/responsive.dart';
import 'package:service_360/view/landing_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      title: '360Groupe',
      locale: const Locale("En"),
      theme: ThemeData(
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      defaultTransition: Transition.cupertinoDialog,
      transitionDuration: Durations.extralong4,
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:service_360/view/landing_page.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    Center(
      child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 430),
          child: const MyApp()),
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
      locale: const Locale("fa"),
      theme: ThemeData(
        dividerColor: Colors.transparent,
        textTheme: GoogleFonts.vazirmatnTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      
      debugShowCheckedModeBanner: false,
      home: const LandingPage(),
    );
  }
}

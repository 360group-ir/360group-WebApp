import 'package:flutter/material.dart';
import 'package:service_360/widgets/app_slider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});


  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: FullscreenSlider(),
      ),
    );
  }
}

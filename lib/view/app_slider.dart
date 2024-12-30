import 'package:Group360/widgets/landing_widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:design_system_360/Colors/mapped.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class FullscreenSlider extends StatefulWidget {
  const FullscreenSlider({super.key});

  @override
  State<FullscreenSlider> createState() => _FullscreenSliderState();
}

class _FullscreenSliderState extends State<FullscreenSlider> {
  final List<Widget> items = [
    const ToolsWidget(),
    const GroupeWidget(),
    const ServiceWidget(),
  ];

  final CarouselSliderController controller = CarouselSliderController();

  int _current = 1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MappedColors.surface.Background,
      body: Builder(
        builder: (context) {
          return Stack(children: [
            CarouselSlider(
                options: CarouselOptions(
                    height: size.height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: false,
                    initialPage: 1,
                    autoPlayAnimationDuration: Durations.extralong4,
                    autoPlayCurve: Easing.legacy,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayOnTouch: true,
                    autoPlay: true,
                    animateToClosest: true,
                    scrollPhysics: const PageScrollPhysics(),
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    enableInfiniteScroll: true),
                carouselController: controller,
                items: items),

            // indicator
            Positioned(
              bottom: size.height * 0.1,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: items.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      setState(() => _current = entry.key);
                      controller.animateToPage(_current);
                    },
                    child: Container(
                      width: 12,
                      height: 12,
                      margin: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 5),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _current == entry.key
                            ? Colors.white.withAlpha(220)
                            : Colors.white30,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ]);
        },
      ),
    );
  }
}

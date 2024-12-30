import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
    required this.color,
    required this.logoPath,
  });
  final Color color;
  final String logoPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 96,
      width: double.infinity,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              logoPath,
              colorFilter:
                  const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}

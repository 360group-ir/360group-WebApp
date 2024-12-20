import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/360Group/group_1.dart';
import 'package:service_360/view/contact_us.dart';

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
      height: 202,
      width: double.infinity,
      color: color,
      child: Column(
        children: [
          (AppDimens.xlarge + 8).height,
          SvgPicture.asset(
            logoPath,
            height: 40,
          ),
          (AppDimens.xlarge + 22).height,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.to(ContactUs(
                      maincolor: color,
                    ));
                  },
                  hoverColor: Colors.transparent,
                  icon: SvgPicture.asset(Assets.svg.vector1,
                      height: 30,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcIn))),
              (AppDimens.large * 2).width,
              IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    launchURL(
                        'https://www.instagram.com/360group.ir?igsh=ZGR3OGN3ejF4aXIx');
                  },
                  icon: SvgPicture.asset(
                    Assets.svg.instagram,
                    height: 32,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  )),
              (AppDimens.large * 2).width,
              IconButton(
                  hoverColor: Colors.transparent,
                  onPressed: () {
                    sendEmail('marketing@360group.ir');
                  },
                  icon: SvgPicture.asset(Assets.svg.mail,
                      height: 38,
                      colorFilter: const ColorFilter.mode(
                          Colors.white, BlendMode.srcIn)))
            ],
          ),
        ],
      ),
    );
  }
}

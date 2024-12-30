import 'package:Group360/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/app_text.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

//Groupe Widget
class GroupeWidget extends StatefulWidget {
  const GroupeWidget({
    super.key,
  });

  @override
  State<GroupeWidget> createState() => _GroupeWidgetState();
}

class _GroupeWidgetState extends State<GroupeWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primaryDefaultG,
      child: Column(
        children: [
          (size.height * 0.15).height,
          Padding(
            padding: const EdgeInsets.all(AppDimens.large),
            child: SvgPicture.asset(
              Assets.svg.logo3603,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralLight, BlendMode.srcIn),
              height: size.height * 0.5,
            ),
          ),
          (size.height * 0.04).height,
          Container(
            width: 190,
            height: 40,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor1,
                  offset: Offset(0, 16),
                  blurRadius: 16)
            ]),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.group, preventDuplicates: true);
                },
                child: const Text(
                  AppText.knowMore,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.tileTxtStyle,
                )),
          ),
          (size.height * 0.18).height
        ],
      ),
    );
  }
}

// Service Widget
class ServiceWidget extends StatefulWidget {
  const ServiceWidget({
    super.key,
  });

  @override
  State<ServiceWidget> createState() => _ServiceWidgetState();
}

class _ServiceWidgetState extends State<ServiceWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primaryDefaultS,
      child: Column(
        children: [
          (size.height * 0.15).height,
          Padding(
            padding: const EdgeInsets.all(AppDimens.large),
            child: SvgPicture.asset(
              Assets.svg.logo3607,
              colorFilter: const ColorFilter.mode(
                  AppColors.neutralLight, BlendMode.srcIn),
              height: size.height * 0.5,
            ),
          ),
          (size.height * 0.04).height,
          Container(
            width: 190,
            height: 40,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor1,
                  offset: Offset(0, 16),
                  blurRadius: 16)
            ]),
            child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteName.services, preventDuplicates: true);
                },
                child: const Text(
                  AppText.showServices,
                  style: AppTextStyles.tileTxtStyle,
                )),
          ),
          (size.height * 0.18).height
        ],
      ),
    );
  }
}

//tools Widget
class ToolsWidget extends StatefulWidget {
  const ToolsWidget({
    super.key,
  });

  @override
  State<ToolsWidget> createState() => _ToolsWidgetState();
}

class _ToolsWidgetState extends State<ToolsWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: AppColors.primaryDefaultT,
      child: Column(
        children: [
          (size.height * 0.15).height,
          Padding(
            padding: const EdgeInsets.all(AppDimens.large),
            child: SvgPicture.asset(
              Assets.svg.logo360TB,
              height: size.height * 0.5,
            ),
          ),
          (size.height * 0.04).height,
          Container(
            width: 190,
            height: 40,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor1,
                  offset: Offset(0, 16),
                  blurRadius: 16)
            ]),
            child: ElevatedButton(
                onPressed: () async {
                  await launchUrl(Uri.parse('https://360tools.io/'));
                },
                child: const Text(
                  AppText.showTools,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.tileTxtStyle,
                )),
          ),
          (size.height * 0.18).height
        ],
      ),
    );
  }
}

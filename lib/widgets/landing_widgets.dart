import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/360Group/group_1.dart';
import 'package:service_360/view/360Service/service_main_page.dart';

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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (size.height*0.22).height,
          Padding(
            padding: const EdgeInsets.all(AppDimens.large),
            child: SvgPicture.asset(
              Assets.svg.groper360,
            ),
          ),
          (size.height*0.03).height,
          const Text(
            AppText.landingSgroup,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyles.landingPage,
          ),
          (size.height*0.05).height,
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
                  Get.to(const Group1());
                },
                child: const Text(
                  AppText.knowMore,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          (size.height*0.19).height
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
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (size.height*0.22).height,
          Padding(
            padding: const EdgeInsets.all(AppDimens.large),
            child: SvgPicture.asset(
              Assets.svg.service360,
            ),
          ),
          (size.height*0.03).height,
          const Text(
            AppText.landingService,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: AppTextStyles.landingPage,
          ),
          (size.height*0.05).height,
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
                  Get.to(const ServiceMainPage());
                  
                },
                child: const Text(
                  AppText.showServices,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          (size.height*0.19).height
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (size.height*0.22).height,
          Padding(
            padding: const EdgeInsets.all(AppDimens.large),
            child: SvgPicture.asset(
              Assets.svg.tools360,
            ),
          ),
          (size.height*0.03).height,
          const Text(
            AppText.landingTools,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: AppTextStyles.landingPageTools,
          ),
          (size.height*0.05).height,
          Container(
            width: 190,
            height: 44,
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  color: AppColors.shadowColor1,
                  offset: Offset(0, 16),
                  blurRadius: 16)
            ]),
            child: ElevatedButton(
                onPressed: () {},
                child: const Text(
                  AppText.comingSoon,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                )),
          ),
          (size.height*0.19).height
        ],
      ),
    );
  }
}

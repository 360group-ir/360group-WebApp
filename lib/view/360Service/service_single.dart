import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/app_text.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/component/responsive.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:Group360/main.dart';
import 'package:Group360/widgets/Expan_service.dart';
import 'package:Group360/widgets/drawer.dart';
import 'package:Group360/widgets/requierment_widget.dart';
import 'package:Group360/widgets/video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ServiceSingle extends StatelessWidget {
  const ServiceSingle({
    super.key, required this.index,
    // required this.title,
    // required this.complement,
    // required this.importance,
    // required this.keyword
  });
final int index;
  @override
  Widget build(BuildContext context) {
    // int index = int.parse(Get.parameters['index']!);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            drawer: const CustomDrawer(
              partColor: AppColors.primaryDefaultS,
              logo: 1,
            ),
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.08),
                child: Container(
                  height: size.height * 0.08,
                  color: AppColors.primaryDefaultS,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              CupertinoIcons.left_chevron,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {
                              showFullScreenDrawer(
                                  context, AppColors.primaryDefaultS, 1);
                            },
                            icon: SvgPicture.asset(Assets.svg.group)),
                      ],
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth:
                              Responsive.isDesktop(context) ? 1080 : size.width),
                      child: Column(
                        children: [
                          Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.padding,
                                  vertical: AppDimens.xlarge),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                  child: CustomVideoPlayer(
                                      videoUrl: Uri.parse("")))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding,
                                vertical: AppDimens.xlarge),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                serviceTitle[index],
                                style: AppTextStyles.titleStyle,
                                textDirection: TextDirection.rtl,
                              ),
                            ),
                          ),
                          ExpanService(
                            expantileOpen: true,
                            title: AppText.complement,
                            children: [
                              Text(
                                serviceComplement[index],
                                style: AppTextStyles.tileChildrenStyle
                                    .copyWith(height: 2),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              )
                            ],
                          ),
                          ExpanService(
                            expantileOpen: false,
                            title: AppText.reason + serviceTitle[index],
                            children: [
                              Text(
                                serviceImportance[index],
                                style: AppTextStyles.tileChildrenStyle
                                    .copyWith(height: 2),
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                              ),
                            ],
                          ),
                          ExpanService(
                            expantileOpen: false,
                            title: AppText.keywords,
                            children: [
                              RequiermentList(
                                  items: keyWords[index]!.toList(growable: true))
                            ],
                          ),
                          (AppDimens.xlarge).height,
                          //Button
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 192),
                            child: MouseRegion(
                              cursor: SystemMouseCursors
                                  .click, // نشانگر ماوس را به کلیک تغییر می‌دهد
                              child: Container(
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDefaultS,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.toNamed(RouteName.contactUs);
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        AppColors.primaryDefaultS, // رنگ پس‌زمینه
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text(
                                    AppText.getadvise,
                                    style: AppTextStyles.landingPage
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    (AppDimens.xlarge).height,
                
                  ],
                ),
              ),
            )));
  }
}

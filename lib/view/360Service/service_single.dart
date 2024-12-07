import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/component/responsive.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/view/landing_page.dart';
import 'package:service_360/widgets/Expan_service.dart';
import 'package:service_360/widgets/drawer.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/requierment_widget.dart';
import 'package:service_360/widgets/video_player.dart';

class ServiceSingle extends StatelessWidget {
  const ServiceSingle(
      {super.key,
      required this.title,
      required this.complement,
      required this.importance,
      required this.keyword});

  final String title;
  final String complement;
  final String importance;
  final List<String> keyword;

  @override
  Widget build(BuildContext context) {
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
                        GestureDetector(
                          onTap: () => Get.offAll(
                            const LandingPage(),
                          ),
                          child: SvgPicture.asset(
                            Assets.svg.service360,
                            height: size.height * 0.0343,
                          ),
                        ),
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
                                borderRadius: BorderRadius.circular(4)),
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
                              title,
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
                              complement,
                              style: AppTextStyles.tileChildrenStyle
                                  .copyWith(height: 2),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            )
                          ],
                        ),
                        ExpanService(
                          expantileOpen: true,
                          title: AppText.reason + title,
                          children: [
                            Text(
                              importance,
                              style: AppTextStyles.tileChildrenStyle
                                  .copyWith(height: 2),
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                            ),
                          ],
                        ),
                        ExpanService(
                          expantileOpen: true,
                          title: AppText.keywords,
                          children: [RequiermentList(items: keyword)],
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
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: TextButton(
                                onPressed: () {
                                },
                                style: TextButton.styleFrom(
                                  backgroundColor:
                                      AppColors.primaryDefaultS, // رنگ پس‌زمینه
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
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
                  Footer(
                    color: AppColors.primaryDefaultS,
                    logoPath: Assets.svg.groper360,
                  ),
                ],
              ),
            )));
  }
}

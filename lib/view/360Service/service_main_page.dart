import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/app_text.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/component/responsive.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:Group360/view/360Service/service_single.dart';
import 'package:Group360/widgets/Expan_service.dart';
import 'package:Group360/widgets/drawer.dart';
import 'package:Group360/widgets/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ServiceMainPage extends StatelessWidget {
  const ServiceMainPage({super.key});

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
      appBar: PreferredSize(
          preferredSize: Size(size.width, size.height * 0.08),
          child: Container(
            height: size.height * 0.08,
            color: AppColors.primaryDefaultS,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.padding),
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
        child: Column(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: Responsive.isDesktop(context) ? 1080 : size.width),
              child: Column(
                children: [
                  // 360 title
                  const Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, AppDimens.xlarge, AppDimens.padding, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppText.serviceTitle,
                        style: AppTextStyles.titleStyle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  // List view
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: serviceTitle.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ExpanService(
                        expantileOpen: index == 0,
                        title: serviceTitle[index],
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Get.toNamed(
                              //   "/${serviceTitle[index]}?index=$index",
                              // );
                              // printError();
                              Get.to(ServiceSingle(index: index),
                                  routeName: '/${serviceTitle[index]}');
                            },
                            child: Visibility(
                              visible: true,
                              child: SizedBox(
                                  height: size.height * 0.4,
                                  child: Image.network(
                                    fit: BoxFit.fitWidth,
                                    height: size.height * 0.4,
                                    imagesLink[index],
                                    loadingBuilder: (context, child,
                                            loadingProgress) =>
                                        loadingProgress == null
                                            ? child
                                            : Center(
                                                child: LoadingAnimationWidget
                                                    .progressiveDots(
                                                  color:
                                                      AppColors.primaryDefaultS,
                                                  size:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          0.07,
                                                ),
                                              ),
                                  )),
                            ),
                          ),
                          AppDimens.padding.height,
                          Text(
                            serviceDesc[index],
                            style: AppTextStyles.tileChildrenStyle
                                .copyWith(height: 2),
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            locale: const Locale("Fa"),
                          ),
                          AppDimens.padding.height,
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 192),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click, //Mouse to click
                              child: Container(
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDefaultS,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(ServiceSingle(index: index),
                                  routeName: '/${serviceTitle[index]}');
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors
                                        .primaryDefaultS, // رنگ پس‌زمینه
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  child: Text(
                                    AppText.knowMore,
                                    style: AppTextStyles.landingPage
                                        .copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
            (size.height * 0.05).height,
            Footer(
              color: AppColors.primaryDefaultS,
              logoPath: Assets.svg.footer,
            ),
          ],
        ),
      ),
    ));
  }
}

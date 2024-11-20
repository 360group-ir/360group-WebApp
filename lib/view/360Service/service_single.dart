import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/Expan_service.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/requierment_widget.dart';
import 'package:service_360/widgets/text_button.dart';
import 'package:service_360/widgets/video_player.dart';

class ServiceSingle extends StatelessWidget {
  const ServiceSingle(
      {super.key,
      required this.title,
      required this.complement,
      required this.importance});

  final String title;
  final String complement;
  final String importance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
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
                        SvgPicture.asset(
                          Assets.svg.service360,
                          height: size.height * 0.0343,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(Assets.svg.group)),
                      ],
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: size.width,
                      width: size.width,
                      child: Center(
                          child: SimpleVideoPlayer(
                              videoUrl: Uri.parse(
                                  "https://ramtindev.storage.c2.liara.space/360%20text/1030%281%29.mp4")))),
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
                    title: AppText.complement,
                    children: [
                      Text(
                        complement,
                        style:
                            AppTextStyles.tileChildrenStyle.copyWith(height: 2),
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                      )
                    ],
                  ),
                  ExpanService(
                    title: AppText.reason + title,
                    children: [
                      Text(
                        importance,
                        style:
                            AppTextStyles.tileChildrenStyle.copyWith(height: 2),
                        textAlign: TextAlign.justify,
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                  ExpanService(
                    title: AppText.keywords,
                    children: [
                      RequiermentList(
                          items: keyWords[0]!.toList(growable: true))
                    ],
                  ),
                  (AppDimens.xlarge).height,
                  const CostumTextButton(
                    title: AppText.getadvise,
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

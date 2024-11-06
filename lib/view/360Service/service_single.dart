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

class ServiceSingle extends StatelessWidget {
  const ServiceSingle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.085),
                child: Container(
                  height: size.height * 0.085,
                  color: AppColors.primaryDefaultS,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppDimens.padding.width,
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: SvgPicture.asset(Assets.svg.group)),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        Assets.svg.service360,
                        height: size.height * 0.0343,
                      ),
                      AppDimens.padding.width,
                    ],
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width,
                    width: size.width,
                    child: Image.asset(
                      Assets.png.imagePlaceH.path,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding,
                        vertical: AppDimens.xlarge),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        serviceTitle[0],
                        style: AppTextStyles.titleStyle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),

                  ExpanService(
                    title: AppText.complement,
                    children: const [Text(AppText.lorem)],
                  ),
                  ExpanService(
                    title: AppText.reason,
                    children: const [Text(AppText.lorem), Text(AppText.lorem)],
                  ),
                  ExpanService(
                    title: AppText.keywords,
                    children: const [Text(AppText.lorem)],
                  ),

                  // send req 2
                  (size.height * 0.1).height,

                  Footer(
                    color: AppColors.primaryDefaultS,
                    logoPath: Assets.svg.groper360,
                  ),
                ],
              ),
            )));
  }
}

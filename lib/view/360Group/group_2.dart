import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/Expan_Gruope.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/text_button.dart';

class Group2 extends StatelessWidget {
  const Group2({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.1),
                child: Container(
                  color: AppColors.primaryDefaultG,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.back();

                          },
                          icon: SvgPicture.asset(Assets.svg.group)),
                      AppDimens.small.width,
                    ],
                  ),
                )),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  //Qr code groupe
                  Container(
                    color: AppColors.primaryDefaultG,
                    height: 400,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          Assets.svg.groper360,
                          height: 64,
                        ),
                        (AppDimens.large * 3).height,
                        Image.asset(
                          Assets.png.qrcode.path,
                        ),
                        (AppDimens.xlarge).height
                      ],
                    ),
                  ),
                  AppDimens.xlarge.height,
                  //Job Offers Text
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimens.padding),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        AppText.jobOfferTitle,
                        style: AppTextStyles.titleStyle,
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                  ),
                  AppDimens.xlarge.height,
                  // Job offer text
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: AppDimens.padding),
                    child: Text(
                      AppText.jobOffers2,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.descriptionStyle,
                    ),
                  ),
                  // Pan list
                  const ExpanGroup(title: AppText.departman1, children: [
                    CostumTextButton(),
                    CostumTextButton(),
                  ]),
                  const ExpanGroup(title: AppText.departman2, children: [
                    CostumTextButton(),
                    CostumTextButton(),
                    CostumTextButton(),
                  ]),
                  const ExpanGroup(title: AppText.departman3, children:  [
                    CostumTextButton(),
                    CostumTextButton(),
                    CostumTextButton(),
                    CostumTextButton(),
                  ]),
                  (AppDimens.xlarge * 2).height,

                   Footer(color: AppColors.primaryDefaultG,logoPath: Assets.svg.groper360 ,),
                ],
              ),
            )));
  }
}

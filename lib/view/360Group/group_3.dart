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
import 'package:service_360/widgets/drawer.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/requierment_widget.dart';
import 'package:service_360/widgets/send_req_form.dart';

class Group3 extends StatelessWidget {
  const Group3({super.key, required this.jobOfferTitle});

  final String jobOfferTitle;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          drawer: const CustomDrawer(partColor: AppColors.primaryDefaultG,logo: 0,),
            backgroundColor: AppColors.neutralLight,
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(size.width, size.height * 0.08),
                child: Container(
                  height: size.height * 0.08,
                  color: AppColors.primaryDefaultG,
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
                          onTap: () => Get.offAll(const LandingPage(),
                              transition: Transition.cupertino),
                          child: SvgPicture.asset(
                            Assets.svg.groper360,
                            height: size.height * 0.0343,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              showFullScreenDrawer(context,AppColors.primaryDefaultG,0);
                            },
                            icon: SvgPicture.asset(Assets.svg.group)),
                      ],
                    ),
                  ),
                )),
            body: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Responsive.isDesktop(context)
                              ? 1080
                              : size.width),
                      child: Column(
                        children: [
                          AppDimens.xlarge.height,
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                jobOfferMap[jobOfferTitle]!['title'],
                                style: AppTextStyles.titleStyle,
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),

                          AppDimens.xlarge.height,

                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                jobOfferMap[jobOfferTitle]!['desc'],
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.right,
                                style: AppTextStyles.descriptionStyle,
                              ),
                            ),
                          ),
                          AppDimens.xlarge.height,
                          // requirment 1
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4)),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(AppDimens.medium),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      AppText.requierd,
                                      style:
                                          AppTextStyles.descriptionTitleStyle,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                                RequiermentList(
                                  items: jobOfferMap[jobOfferTitle]!['reqLIst'],
                                ),
                                AppDimens.medium.height
                              ],
                            ),
                          ),
                          // send req 2
                          AppDimens.xlarge.height,
                          const SendReqForm(
                            color: AppColors.primaryDefaultG,
                            uploadResume: true,
                          ),
                          AppDimens.large.height,
                        ],
                      ),
                    ),
                  ),
                  Footer(
                    color: AppColors.primaryDefaultG,
                    logoPath: Assets.svg.groper360,
                  ),
                ],
              ),
            )));
  }
}

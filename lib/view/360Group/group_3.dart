import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/app_text.dart';
import 'package:Group360/component/res/text_styles.dart';
import 'package:Group360/component/responsive.dart';
import 'package:Group360/gen/assets.gen.dart';
import 'package:Group360/widgets/drawer.dart';

import 'package:Group360/widgets/requierment_widget.dart';
import 'package:Group360/widgets/send_req_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Group3 extends StatelessWidget {
  const Group3({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String jobOfferTitle = Get.parameters['jobOfferTitle']!;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            drawer: const CustomDrawer(
              partColor: AppColors.primaryDefaultG,
              logo: 0,
            ),
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
                        IconButton(
                            onPressed: () {
                              showFullScreenDrawer(
                                  context, AppColors.primaryDefaultG, 0);
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
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(AppDimens.medium),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      AppText.sharyet,
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
                          AppDimens.xlarge.height,
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(AppDimens.medium),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "شرح وظایف",
                                      style:
                                          AppTextStyles.descriptionTitleStyle,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                                RequiermentList(
                                  items: jobOfferMap[jobOfferTitle]![
                                      'responsibility'],
                                ),
                                AppDimens.medium.height
                              ],
                            ),
                          ),
                          AppDimens.xlarge.height,
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(AppDimens.medium),
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "مزایا و امکانات",
                                      style:
                                          AppTextStyles.descriptionTitleStyle,
                                      textDirection: TextDirection.rtl,
                                    ),
                                  ),
                                ),
                                RequiermentList(
                                  items:
                                      jobOfferMap[jobOfferTitle]!['eqiupment'],
                                ),
                                AppDimens.medium.height
                              ],
                            ),
                          ),
                          AppDimens.xlarge.height,
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppDimens.padding),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child:  Padding(
                              padding: const EdgeInsets.all(AppDimens.padding),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '''🔍 چه کسانی برای این موقعیت مناسب هستند؟
             دانشجویان و فارغ‌التحصیلان علاقه‌مند به حوزه دیجیتال و فناوری
             افرادی که مهارت‌های ارتباطی بالا دارند و از کار با مشتریان لذت می‌برند
             کسانی که به دنبال یادگیری و رشد شغلی در حوزه دیجیتال هستند.
                            
  ✨ فرصتی منحصربه‌فرد برای یادگیری، رشد و کسب درآمد در حوزه دیجیتال و فناوری!
  📢 همراه با آموزش + تجربه عملی + درآمد عالی''',
                                  textDirection: TextDirection.rtl,
                                  textAlign: TextAlign.right,
                                  style: AppTextStyles.descriptionStyle.copyWith(
                                      height: 2
                                      ),
                                ),
                              ),
                            ),
                          ),
                          AppDimens.xlarge.height,
                          // send req 2
                          const SendReqForm(
                            color: AppColors.primaryDefaultG,
                            uploadResume: false,
                          ),
                          AppDimens.large.height,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}

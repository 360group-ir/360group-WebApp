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
import 'package:service_360/view/360Group/group_2.dart';
import 'package:service_360/widgets/Expan_Gruope.dart';
import 'package:service_360/widgets/Icon_widget.dart';
import 'package:service_360/widgets/drawer.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/user_cart.dart';

class Group1 extends StatelessWidget {
  const Group1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // int crossAxisCount = 2;
    // if (Responsive.isTablet(context)) {
    //   crossAxisCount = 4;
    // } else if (Responsive.isDesktop(context)) {
    //   crossAxisCount = 6;
    // }
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            drawer: CustomDrawer(),
            // appBar
            appBar: PreferredSize(
                preferredSize: Size(
                    Responsive.isDesktop(context) ? 1080 : size.width,
                    size.height * 0.08),
                child: Container(
                  height: size.height * 0.08,
                  color: AppColors.primaryDefaultG,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.padding),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: const Icon(
                              CupertinoIcons.left_chevron,
                              color: Colors.white,
                            )),
                        const Expanded(child: SizedBox()),
                        IconButton(
                            onPressed: () {
                              showFullScreenDrawer(context);
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
                  //Qr code groupe
                  Container(
                    color: AppColors.primaryDefaultG,
                    // height: 400,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        (AppDimens.large).height,
                        SvgPicture.asset(
                          Assets.svg.groper360,
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.2
                              : size.width * 0.3,
                        ),
                        (AppDimens.large * 2).height,
                        Image.asset(
                          Assets.png.qrcode.path,
                        ),
                        (AppDimens.large).height,
                      ],
                    ),
                  ),
                  //List tiles
                  AppDimens.small.height,

                  // constrainted box
                  ConstrainedBox(
                    constraints: BoxConstraints(
                        maxWidth:
                            Responsive.isDesktop(context) ? 1080 : size.width),
                    child: Column(
                      children: [
                        ExpanGroup(
                          title: "درباره ما ",
                          children: [
                            AppDimens.padding.height,
                            const Text(
                              AppText.aboutUs,
                              style: AppTextStyles.tileChildrenStyle,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),

                        //Contact Us
                        ExpanGroup(title: 'راه‌های ارتباطی', children: [
                          AppDimens.small.height,
                          // Responsive.isMobile ?
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppDimens.large),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconWidget(
                                  assetsName: Assets.svg.vector,
                                  text: AppText.phone,
                                ),
                                Visibility(
                                  visible: Responsive.isTablet(context)
                                      ? true
                                      : Responsive.isDesktop(context)
                                          ? true
                                          : false,
                                  child: IconWidget(
                                    assetsName: Assets.svg.icon3,
                                    text: AppText.linkdin,
                                  ),
                                ),
                                IconWidget(
                                  assetsName: Assets.svg.icon,
                                  text: AppText.website,
                                ),
                                IconWidget(
                                  assetsName: Assets.svg.icon1,
                                  text: AppText.address,
                                ),
                                Visibility(
                                  visible: Responsive.isTablet(context)
                                      ? true
                                      : Responsive.isDesktop(context)
                                          ? true
                                          : false,
                                  child: IconWidget(
                                    assetsName: Assets.svg.icon4,
                                    text: AppText.insta,
                                  ),
                                ),
                                IconWidget(
                                  assetsName: Assets.svg.icon2,
                                  text: AppText.email,
                                ),
                              ],
                            ),
                          ),
                          (AppDimens.padding * 2).height,
                          Visibility(
                            visible: Responsive.isTablet(context)
                                ? false
                                : Responsive.isDesktop(context)
                                    ? false
                                    : true,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppDimens.large),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconWidget(
                                    assetsName: Assets.svg.icon3,
                                    text: AppText.linkdin,
                                  ),
                                  IconWidget(
                                    assetsName: Assets.svg.icon4,
                                    text: AppText.insta,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]),

                        // Job offers
                        ExpanGroup(title: "فرصت‌های شغلی", children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              AppText.jobOffers,
                              maxLines: 10,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.tileChildrenStyle,
                            ),
                          ),
                          AppDimens.xlarge.height,
                          ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 435),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: AppColors.primaryDefaultG,
                                  borderRadius: BorderRadius.circular(4)),
                              child: TextButton(
                                onPressed: () {
                                  Get.to(const Group2());
                                },
                                child: Text(
                                  AppText.knowMore,
                                  style: AppTextStyles.landingPage
                                      .copyWith(fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                          AppDimens.small.height
                        ]),

                        // our Team
                        Visibility(
                          visible: Responsive.isDesktop(context) ? false : true,
                          child: ExpanGroup(title: "تیم ما", children: [
                            ListView.builder(
                              itemCount: userList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return UsersCart(
                                  imgUrl: userList[index]!['imgUrl'],
                                  name: userList[index]!['name'],
                                  side: userList[index]!['side'],
                                  email: userList[index]!['emailUrl'],
                                  linkdin: userList[index]!['LinkdinUrl'],
                                );
                              },
                            )
                          ]),
                        ),
                        Visibility(
                          visible: Responsive.isDesktop(context) ? true : false,
                          child: ExpanGroup(
                            title: "تیم ما",
                            children: [
                              GridView.builder(
                                itemCount: userList.length,
                                physics:
                                    const NeverScrollableScrollPhysics(), // غیرفعال کردن اسکرول
                                shrinkWrap:
                                    true, // برای گریدویو در ویجت‌های کوچک ضروری است
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // تعداد ستون‌ها
                                  crossAxisSpacing: 16.0, // فاصله بین ستون‌ها
                                  mainAxisSpacing: 16.0, // فاصله بین ردیف‌ها
                                  childAspectRatio:
                                      2 / 3.1, // نسبت ابعاد هر آیتم
                                ),
                                itemBuilder: (context, index) {
                                  return UsersCart(
                                    imgUrl: userList[index]!['imgUrl'],
                                    name: userList[index]!['name'],
                                    side: userList[index]!['side'],
                                    email: userList[index]!['emailUrl'],
                                    linkdin: userList[index]!['LinkdinUrl'],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // about us

                  (AppDimens.xlarge * 2).height,

                  Footer(
                      color: AppColors.primaryDefaultG,
                      logoPath: Assets.svg.groper360)
                ],
              ),
            )));
  }
}

List<Map<String, dynamic>> items = [
  {
    'icon': Assets.svg.vector,
    "text": AppText.phone,
  },
  {
    'icon': Assets.svg.icon,
    "text": AppText.website,
  },
  {
    'icon': Assets.svg.icon1,
    "text": AppText.address,
  },
  {
    'icon': Assets.svg.icon2,
    "text": AppText.email,
  },
  {
    'icon': Assets.svg.icon3,
    "text": AppText.linkdin,
  },
  {
    'icon': Assets.svg.icon4,
    "text": AppText.insta,
  },
];

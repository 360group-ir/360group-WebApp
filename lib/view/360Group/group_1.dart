import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
import 'package:service_360/widgets/costum_bottomshit.dart';
import 'package:service_360/widgets/drawer.dart';
import 'package:service_360/widgets/footer.dart';
import 'package:service_360/widgets/user_cart.dart';
import 'package:url_launcher/url_launcher.dart';

class Group1 extends StatelessWidget {
  const Group1({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.neutralLight,
            drawer: const CustomDrawer(
              partColor: AppColors.primaryDefaultG,
              logo: 0,
            ),
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
                          Assets.svg.logo3603,
                          colorFilter: const ColorFilter.mode(
                              AppColors.neutralLight, BlendMode.srcIn),
                          width: Responsive.isDesktop(context)
                              ? size.width * 0.3
                              : size.width * 0.4,
                        ),
                        
                        (AppDimens.large ).height,
                        QrImageView(
                          data: Uri.base.toString(),
                          version: QrVersions.auto,
                          size: size.height * 0.18,
                          dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.square,
                              color: Colors.white),
                          eyeStyle: const QrEyeStyle(
                            eyeShape: QrEyeShape.square,
                            color: Colors.white,
                          ),
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
                          expantileOpen: true,
                          children: [
                            AppDimens.small.height,
                            const Text(
                              AppText.aboutUs,
                              style: AppTextStyles.tileChildrenStyle,
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                            )
                          ],
                        ),

                        //Contact Us
                        ExpanGroup(
                            title: 'راه‌های ارتباطی',
                            expantileOpen: true,
                            children: [
                              AppDimens.small.height,
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppDimens.padding),
                                child: Row(
                                  mainAxisAlignment:
                                      Responsive.isDesktop(context)
                                          ? MainAxisAlignment.spaceEvenly
                                          : MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconWidget(
                                      iconName: CupertinoIcons.phone_fill,
                                      text: AppText.phone,
                                      onpress: () {
                                        makePhoneCall('tel:${02191099213}');
                                      },
                                    ),
                                    IconWidget(
                                      iconName: CupertinoIcons.location_solid,
                                      text: AppText.address,
                                      onpress: () {
                                        Get.bottomSheet(
                                          MainBottomShit(),
                                          isScrollControlled: true,
                                        );
                                      },
                                    ),
                                    IconWidget(
                                      assetsName: Assets.svg.icon4,
                                      text: AppText.insta,
                                      onpress: () {
                                        launchURL(
                                            'https://www.instagram.com/360group.ir?igsh=ZGR3OGN3ejF4aXIx');
                                      },
                                    ),
                                    IconWidget(
                                      iconName: CupertinoIcons.mail_solid,
                                      text: AppText.email,
                                      onpress: () {
                                        sendEmail('marketing@360group.ir');
                                      },
                                    ),
                                  ],
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
                            constraints: const BoxConstraints(maxWidth: 192),
                            child: MouseRegion(
                              cursor: SystemMouseCursors
                                  .click, // نشانگر ماوس را به کلیک تغییر می‌دهد
                              child: Container(
                                height: 48,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.primaryDefaultG,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(const Group2());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: AppColors
                                        .primaryDefaultG, // رنگ پس‌زمینه
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

                  (size.height * 0.1).height,

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

void makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

void launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    if (kDebugMode) {
      print('Could not launch $url');
    }
  }
}

void sendEmail(String recipientEmail) async {
  const String subject = "موضوع ایمیل"; // موضوع ایمیل
  const String body = "سلام، این متن پیش‌فرض ایمیل است."; // متن ایمیل

  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: recipientEmail,
    query: encodeQueryParameters(<String, String>{
      'subject': subject,
      'body': body,
    }),
  );

  if (await canLaunchUrl(emailUri)) {
    await launchUrl(emailUri);
  } else {
    throw 'Could not launch $emailUri';
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}

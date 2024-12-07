import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/component/responsive.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/Icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersCart extends StatefulWidget {
  const UsersCart({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.side,
    required this.email,
    required this.linkdin,
  });
  final List<String> imgUrl;
  final String name;
  final String side;
  final String email;
  final String linkdin;
  @override
  State<UsersCart> createState() => _UsersCartState();
}

class _UsersCartState extends State<UsersCart> {
  int _currentIndex = 0; // عکس فعلی
  // Timer? _timer; // تایمر برای موبایل

  @override
  void initState() {
    super.initState();
    // در اینجا هیچ‌گونه وابستگی به MediaQuery نداریم.
  }

  void _onHover(bool isHovering) {
    if (Responsive.isDesktop(context)) {
      // در دسکتاپ، هنگام هاور عکس تغییر می‌کند
      if (isHovering) {
        setState(() {
          _currentIndex = (_currentIndex + 1) % widget.imgUrl.length;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.small, horizontal: AppDimens.padding),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              height: Responsive.isDesktop(context)? 596 : 505,
              child: MouseRegion(
                onEnter: (_) => _onHover(true), // هاور ماوس
                onExit: (_) => _onHover(false),
                child: GestureDetector(
                  onTap: () {
                    if (_currentIndex != widget.imgUrl.length - 1) {
                      setState(() {
                        _currentIndex = _currentIndex + 1;
                      });
                    } else {
                      setState(() {
                        _currentIndex = 0;
                      });
                    }
                  },
                  child: CachedNetworkImage(
                    useOldImageOnUrlChange: false,
                    imageUrl: widget.imgUrl[_currentIndex],
                    fadeInDuration: Durations.long2,
                    fadeOutDuration: Durations.long2,
                    placeholder: (context, url) {
                      return SizedBox(
                        height: Responsive.isDesktop(context)? 596 : 505,
                        child: Center(
                            child: LoadingAnimationWidget.progressiveDots(
                                color: AppColors.primaryDefaultG, size: 55)),
                      );
                    },
                    cacheManager: CustomCacheManager.instance,
                    
                  ),
                ),
              ).animate().fadeIn(duration: Durations.medium3),
            ),
            AppDimens.small.height,
            Text(
              widget.name,
              style: AppTextStyles.landingPageTools,
            ),
            AppDimens.small.height,
            Text(
              widget.side,
              style: AppTextStyles.expansionTileChildren,
            ),
            AppDimens.padding.height,
            Row(
              children: [
                AppDimens.padding.width,
                IconWidget(
                  assetsName: Assets.svg.icon3,
                  text: AppText.linkdin,
                  onpress: () => launchUrl(Uri.parse(widget.linkdin)),
                ),
                AppDimens.padding.width,
                IconWidget(
                  iconName: CupertinoIcons.mail_solid,
                  text: AppText.email,
                  onpress: () => launchUrl(Uri.parse("mailto:${widget.email}")),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> _sendEmail(String path) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: path, //
      query: Uri.encodeFull(
          'subject=موضوع ایمیل&body=متن ایمیل'), // موضوع و متن ایمیل
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      throw 'Could not launch $emailUri';
    }
  }
}

Map<int, Map> userList = {
  0: {
    'name': "سینا گلزار",
    'side': "مدیر عامل",
    'imgUrl': [
      'https://360bucket.storage.c2.liara.space/images%20/sina/IMG_2857%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/sina/IMG_2865%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/sina/IMG_2868%201080.png'
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "golzar@360group.ir",
  },
  1: {
    'name': "احسان قابچی",
    'side': "مدیریت اجرایی",
    'imgUrl': [
      'https://360bucket.storage.c2.liara.space/images%20/ehsan/IMG_2817%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/ehsan/IMG_2824%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/ehsan/IMG_2827%201080.png',
    ],
    'LinkdinUrl': "https://www.linkedin.com/in/ehsanghabchi/",
    'emailUrl': "ghabchi@360group.ir",
  },
  2: {
    'name': "امیرحسین اسکندرپور",
    'side': "مسئول فناوری و زیر ساخت",
    'imgUrl': [
      'https://360bucket.storage.c2.liara.space/images%20/amirhossein/IMG_3056%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/amirhossein/IMG_3066%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/amirhossein/IMG_3068%201080.png',
    ],
    'LinkdinUrl': "https://www.linkedin.com/in/amirhossein-es/",
    'emailUrl': "eskandarpour@360group.ir",
  },
  3: {
    'name': "زهرا سراجی",
    'side': "طراحی گرافیکی",
    'imgUrl': [
      'https://360bucket.storage.c2.liara.space/images%20/zahra/IMG_2756%20ss%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/zahra/IMG_2763%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/zahra/IMG_2769%201080.png',
    ],
    'LinkdinUrl': "https://www.linkedin.com/in/zahra-seraji/",
    'emailUrl': "seraji@360group.ir",
  },
  4: {
    'name': "مهرداد صفری",
    'side': "حسابداری",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/images%20/mehrdad/IMG_2979%201080%20%281%29.png"
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  5: {
    'name': "امید غدیری",
    'side': "مسئول تولید محتوا و طراحی",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/images%20/omid/IMG_2792%201080.png",
      "https://360bucket.storage.c2.liara.space/images%20/omid/IMG_2800%201080.png",
      "https://360bucket.storage.c2.liara.space/images%20/omid/IMG_2831%201080.png"
    ],
    'LinkdinUrl': "http://www.linkedin.com/in/omid-ghadiri/",
    'emailUrl': "ghadiri@360group.ir",
  },
  6: {
    'name': "رامتین بریلی",
    'side': "توسعه دهنده اپلیکیشن ( فلاتر)",
    'imgUrl': [
      'https://360bucket.storage.c2.liara.space/images%20/ramtin/IMG_3021%201080.png',
      "https://360bucket.storage.c2.liara.space/images%20/ramtin/IMG_3008%201080.png",
      'https://360bucket.storage.c2.liara.space/images%20/ramtin/IMG_3022%201080.png'
    ],
    'LinkdinUrl': "https://www.linkedin.com/in/ramtin-boreili/",
    'emailUrl': "boreili@360group.ir",
  },
  7: {
    'name': "امیرعلی زیبادخت",
    'side': "کارشناس تولید محتوا و طراحی هوش مصنوعی ",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/images%20/amirali/Amirali%201080.png",
      'https://360bucket.storage.c2.liara.space/images%20/amirali/amirali%202%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/amirali/amirali%203%201080.png'
    ],
    'LinkdinUrl': "https://www.linkedin.com/in/amirali-zibadokht/",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  8: {
    'name': "شایان علم بیگی",
    'side': "توسعه دهنده بک اند",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/images%20/shayan/IMG_3261%201080.png",
      'https://360bucket.storage.c2.liara.space/images%20/shayan/IMG_3262%201080.png',
      'https://360bucket.storage.c2.liara.space/images%20/shayan/IMG_3264%201080.png'
    ],
    'LinkdinUrl': "https://www.linkedin.com/in/shayan-alambeigi/",
    'emailUrl': "beigi@360group.ir",
  },
};

class CustomCacheManager {
  static final BaseCacheManager instance = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 7), 
      maxNrOfCacheObjects: 150,
    ),
  );
}

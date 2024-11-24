import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
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
    required this.email, required this.linkdin,
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            MouseRegion(
              onEnter: (_) => _onHover(true), // هاور ماوس
              onExit: (_) => _onHover(false),
              child: GestureDetector(
                onTap: () {
                  if (_currentIndex != widget.imgUrl.length - 1) {
                    setState(() {
                      _currentIndex = _currentIndex+1;
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
                      height: 457.5,
                      child: Center(
                          child: LoadingAnimationWidget.progressiveDots(
                              color: AppColors.primaryDefaultG, size: 50)),
                    );
                  },
                  cacheManager: CustomCacheManager.instance,
                ),
              ),
            ).animate().fadeIn(duration: Durations.medium3),
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
                  onpress:()=> launchUrl(Uri.parse(widget.linkdin)),
                ),
                AppDimens.padding.width,
                IconWidget(
                  assetsName: Assets.svg.icon2,
                  text: AppText.email,
                  onpress:()=> launchUrl(Uri.parse("mailto:${widget.email}")),
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
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/sina%20Golzar/IMG_2868.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/sina%20Golzar/IMG_2865.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/sina%20Golzar/IMG_2857.png"
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "golzar@360group.ir",
  },
  1: {
    'name': "احسان قابچی",
    'side': "مدیریت اجرایی",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Ehsan%20Ghabchi/IMG_2817.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Ehsan%20Ghabchi/IMG_2824.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Ehsan%20Ghabchi/IMG_2827.png",
    ],
    'LinkdinUrl':
        "https://www.linkedin.com/in/ehsanghabchi/",
    'emailUrl': "ghabchi@360group.ir",
  },
  2: {
    'name': "امیرحسین اسکندرپور",
    'side': "مسئول فناوری و زیر ساخت",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/amirhossein%20EskandarPour/IMG_3056.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/amirhossein%20EskandarPour/IMG_3066.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/amirhossein%20EskandarPour/IMG_3068.png",
    ],
    'LinkdinUrl':
        "https://www.linkedin.com/in/amirhossein-es/",
    'emailUrl': "eskandarpour@360group.ir",
  },
  3: {
    'name': "زهرا سراجی",
    'side': "طراحی گرافیکی",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Zahra%20Seraji/IMG_2763.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Zahra%20Seraji/IMG_2756%20ss.png",
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/Zahra%20Seraji/IMG_2769.png'
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "seraji@360group.ir",
  },
  4: {
    'name': "مهرداد صفری",
    'side': "حسابداری",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/mehrdad%20safari%20/IMG_2979.png"
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  5: {
    'name': "امید غدیری",
    'side': "مسئول تولید محتوا و طراحی",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Omid%20Ghadiri/IMG_2831.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Omid%20Ghadiri/IMG_2800.png",
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Omid%20Ghadiri/IMG_2792.png"
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "ghadiri@360group.ir",
  },
  6: {
    'name': "رامتین بریلی",
    'side': "توسعه دهنده اپلیکیشن ( فلاتر)",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/Ramtin%20Boreli%20/IMG_3021.png",
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/Ramtin%20Boreli%20/IMG_3008.png',
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/Ramtin%20Boreli%20/IMG_3022.png'
    ],
    'LinkdinUrl':
        "https://www.linkedin.com/in/ramtin-boreili/",
    'emailUrl': "boreili@360group.ir",
  },
  7: {
    'name': "امیر علی زیبا دخت",
    'side': "کارشناس تولید محتوا ",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/amir%20ali%20zibadokht/Amirali.png",
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/amir%20ali%20zibadokht/57d67505-8142-43d9-8619-dcd94589d81d.png',
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/amir%20ali%20zibadokht/b253a91f-05c4-4524-9ce4-3f85f3608ec0.png'
    ],
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  8: {
    'name': "شایان علم بیگی",
    'side': "توسعه دهنده بک اند",
    'imgUrl': [
      "https://360bucket.storage.c2.liara.space/Our%20Team%20/shayan%20Beigi%20/IMG_3261.png",
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/shayan%20Beigi%20/IMG_3262.png',
      'https://360bucket.storage.c2.liara.space/Our%20Team%20/shayan%20Beigi%20/IMG_3264.png'
    ],
    'LinkdinUrl':
        "https://www.linkedin.com/in/shayan-alambeigi/",
    'emailUrl': "beigi@360group.ir",
  },
};

class CustomCacheManager {
  static final BaseCacheManager instance = CacheManager(
    Config(
      'customCacheKey',
      stalePeriod: const Duration(days: 7), // مدت زمانی که فایل‌ها در کش بمانند
      maxNrOfCacheObjects: 150,
       // تعداد فایل‌های کش
    ),
  );
}

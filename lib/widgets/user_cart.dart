import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/Icon_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class UsersCart extends StatelessWidget {
  const UsersCart({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.side,
    // required this.email,
  });
  final String imgUrl;
  final String name;
  final String side;
  // final String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CachedNetworkImage(
              imageUrl: imgUrl,
              placeholder: (context, url) {
                return Center(
                    child: LoadingAnimationWidget.progressiveDots(
                        color: AppColors.primaryDefaultG, size: 50));
              },
            ),
            AppDimens.small.height,
            Text(
              name,
              style: AppTextStyles.landingPageTools,
            ),
            AppDimens.small.height,
            Text(
              side,
              style: AppTextStyles.expansionTileChildren,
            ),
            AppDimens.padding.height,
            Row(
              children: [
                AppDimens.padding.width,
                IconWidget(
                  assetsName: Assets.svg.icon3,
                  text: AppText.linkdin,
                ),
                AppDimens.padding.width,
                IconWidget(
                  assetsName: Assets.svg.icon2,
                  text: AppText.email,
                  // onpress: _sendEmail(email),
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
      path: path, // آدرس ایمیل مقصد
      query: Uri.encodeFull('subject=موضوع ایمیل&body=متن ایمیل'), // موضوع و متن ایمیل
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
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/sina%20Golzar/IMG_2868.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "golzar@360group.ir",
  },
  1: {
    'name': "احسان قابچی",
    'side': "مدیریت اجرایی",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/Ehsan%20Ghabchi/IMG_2817.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "ghabchi@360group.ir",
  },
  2: {
    'name': "امیرحسین اسکندرپور",
    'side': "مسئول فناوری و زیر ساخت",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/amirhossein%20EskandarPour/IMG_3056.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "eskandarpour@360group.ir",
  },
  3: {
    'name': "زهرا سراجی",
    'side': "طراحی گرافیکی",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/Zahra%20Seraji/IMG_2763.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "seraji@360group.ir",
  },
  4: {
    'name': "مهرداد صفری",
    'side': "حسابداری",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/mehrdad%20safari%20/IMG_2979.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  5: {
    'name': "امید قدیری",
    'side': "مسئول تولید محتوا و طراحی",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/Omid%20Ghadiri/IMG_2831.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "ghadiri@360group.ir",
  },
  6: {
    'name': "رامتین بریلی",
    'side': "توسعه دهنده اپلیکیشن ( فلاتر)",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/Ramtin%20Boreli%20/IMG_3021.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "boreili@360group.ir",
  },
  7: {
    'name': "امیر علی زیبا دخت",
    'side': "کارشناس تولید محتوا ",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/mehrdad%20safari%20/IMG_2979.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  8: {
    'name': "شایان علم بیگی",
    'side': "توسعه دهنده بک اند",
    'imgUrl':
        "https://360bucket.storage.c2.liara.space/Our%20Team%20/shayan%20Beigi%20/IMG_3261.png",
    'LinkdinUrl':
        "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "beigi@360group.ir",
  },
};

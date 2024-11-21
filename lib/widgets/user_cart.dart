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

class UsersCart extends StatelessWidget {
  const UsersCart({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.side,
  });
  final String imgUrl;
  final String name;
  final String side;
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
            Row(
              children: [
                IconWidget(assetsName: Assets.svg.icon4, text: AppText.insta),
                AppDimens.padding.width,
                IconWidget(assetsName: Assets.svg.icon2, text: AppText.email)
              ],
            )
          ],
        ),
      ),
    );
  }
}

Map<int, Map> userList = {
  0: {
    'name': "سینا گلزار",
    'side': "مدیر عامل",
    'imgUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'instaUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  1: {
    'name': "احسان قابچی",
    'side': "تحقیق و توسعه",
    'imgUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'instaUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
  },
  2: {
    'name': "امیرحسین اسکندرپور",
    'side': "مسئول فناوری و زیر ساخت",
    'imgUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'instaUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",

  },
  3: {
    'name': "زهرا سراجی",
    'side': "طراحی گرافیکی",
    'imgUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'instaUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",
    'emailUrl': "https://ramtindev.storage.c2.liara.space/360%20text/image.png",

  },
};

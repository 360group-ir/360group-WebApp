
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/text_styles.dart';

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
   IconWidget({
    super.key,
    required this.assetsName,
    required this.text, this.onpress,
  });
  String assetsName ;
  String text ;
  final onpress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:  4.0),
      child: Column(
        children: [
          IconButton(
            onPressed: onpress,
            icon: Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                color: AppColors.neutralLight,
                borderRadius: BorderRadius.all(Radius.circular(4)),
                boxShadow: [
                  BoxShadow(color: AppColors.shadowColor2 , offset: Offset(0, 1), blurRadius: 4),
                  BoxShadow(color: AppColors.shadowColor1 , offset: Offset(0, 1), blurRadius: 4),
                ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.small),
                child: SvgPicture.asset(assetsName),
              ),
            ),
          ),
          AppDimens.small.height,
           Text(text, style: AppTextStyles.expansionTileChildren,)
        ],
      ),
    );
  }
}

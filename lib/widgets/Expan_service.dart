
import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/text_styles.dart';

// ignore: must_be_immutable
class ExpanService extends StatelessWidget {
    ExpanService({
    super.key, required this.title, required this.children
    
  });
final String title ;
List <Widget> children ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDimens.large, AppDimens.large, AppDimens.large, 0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)),
          child: ExpansionTile(
            //TODO: Animation 
            expansionAnimationStyle: AnimationStyle(curve: Curves.easeInExpo),
            iconColor: AppColors.primaryDefaultS,
            tilePadding:
                const EdgeInsets.symmetric(horizontal: AppDimens.small),
            title:  Text(
              title,
              textDirection: TextDirection.rtl,
              textAlign: TextAlign.right,
              style: AppTextStyles.tileTxtStyle,
            ),
            childrenPadding: const EdgeInsets.all(AppDimens.small),
            children: children
          )),
    );
  }
}

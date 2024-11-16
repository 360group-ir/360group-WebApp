
import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/text_styles.dart';

class ExpanGroup extends StatelessWidget {
  const ExpanGroup({
    super.key, required this.title, required this.children,
  });
final String title ;
final List<Widget> children ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(AppDimens.large,
          AppDimens.large, AppDimens.large, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(4)),
        child:  ExpansionTile(
          title: Text(
            title ,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: AppTextStyles.tileTxtStyle,
          ),
          childrenPadding: const EdgeInsets.all(AppDimens.medium),
          iconColor: AppColors.primaryDefaultG,
          collapsedIconColor: Colors.black,
          children: children,
        ),
      ),
    );
  }
}

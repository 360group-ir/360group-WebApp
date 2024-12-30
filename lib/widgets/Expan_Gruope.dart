import 'package:flutter/material.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/text_styles.dart';

class ExpanGroup extends StatelessWidget {
  const ExpanGroup({
    super.key,
    required this.title,
    required this.children,
    this.expantileOpen = false,
  });
  final String title;
  final List<Widget> children;
  final bool expantileOpen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDimens.large, AppDimens.large, AppDimens.large, 0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(4)),
        child: ExpansionTile(
          expansionAnimationStyle: AnimationStyle(
              curve: Curves.ease, duration: const Duration(milliseconds: 600)),
          title: Text(
            title,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: AppTextStyles.tileTxtStyle,
          ),
          initiallyExpanded: expantileOpen,
          childrenPadding: const EdgeInsets.symmetric(
              horizontal: AppDimens.medium, vertical: AppDimens.small),
          iconColor: AppColors.primaryDefaultG,
          collapsedIconColor: Colors.black,
          children: children,
        ),
      ),
    );
  }
}

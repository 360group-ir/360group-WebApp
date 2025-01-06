import 'package:flutter/material.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/text_styles.dart';

// ignore: must_be_immutable
class ExpanService extends StatelessWidget {
  ExpanService({super.key, required this.title, required this.children, required this.expantileOpen});
  final String title; 
  List<Widget> children;
  final bool expantileOpen;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
          AppDimens.large, AppDimens.large, AppDimens.large, 0),
      child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: ExpansionTile(
            clipBehavior: Clip.hardEdge,
            initiallyExpanded: expantileOpen,
              expansionAnimationStyle: AnimationStyle(
                  curve: Curves.ease,
                  duration: const Duration(milliseconds: 600)),
              iconColor: AppColors.primaryDefaultS,
              tilePadding:
                  const EdgeInsets.symmetric(horizontal: AppDimens.small),
              title: Text(
                title,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.right,
                style: AppTextStyles.tileTxtStyle,
              ),
              childrenPadding: const EdgeInsets.all(AppDimens.small),
              children: children)),
    );
  }
}

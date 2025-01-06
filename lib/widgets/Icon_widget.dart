import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/extentions.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/text_styles.dart';

// ignore: must_be_immutable
class IconWidget extends StatelessWidget {
  IconWidget({
    super.key,
    this.assetsName = '',
    required this.text,
    this.onpress,
    this.iconName = CupertinoIcons.add,
  });
  String assetsName;
  String text;
  final onpress;
  final IconData iconName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Column(
        children: [
          IconButton(
            hoverColor: Colors.transparent,
            onPressed: onpress,
            icon: Container(
              height: 44,
              width: 44,
              decoration: const BoxDecoration(
                  color: AppColors.neutralLight,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.shadowColor,
                        offset: Offset(0, 1),
                        blurRadius: 4),
                    BoxShadow(
                        color: AppColors.shadowColor1,
                        offset: Offset(0, 1),
                        blurRadius: 4),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(AppDimens.small),
                child: assetsName == ''
                    ? Center(
                        child: Icon(
                        iconName,
                        color: Colors.black,
                        size: 28,
                      ))
                    : SvgPicture.asset(
                        assetsName,
                        height: 28,
                        placeholderBuilder: (BuildContext context) =>
                            const CircularProgressIndicator(),
                      ),
              ),
            ),
          ),
          AppDimens.small.height,
          Text(
            text,
            style: AppTextStyles.expansionTileChildren,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/text_styles.dart';

class ReqFormTextfeild extends StatelessWidget {
  const ReqFormTextfeild({
    super.key,
    required this.hintText,
  });
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: AppDimens.small, horizontal: AppDimens.small),
      child: Container(
        height: 40,
        padding:const EdgeInsets.all(AppDimens.small) ,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
          boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor2,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: AppColors.shadowColor1,
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
        ]),
        child: TextField(
          textAlign: TextAlign.start,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.sendReqTextFeildHint,
              focusColor: AppColors.neutralLight,
              fillColor: AppColors.neutralLight,
              border: InputBorder.none),
        ),
      ),
    );
  }
}

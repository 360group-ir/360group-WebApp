
import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/app_colors.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key, required this.keyboardType,
  });
final TextInputType keyboardType ;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: AppDimens.small),
      child: SizedBox(
        height: 40,
        child: TextField(
          keyboardType: keyboardType,
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            hintText: "....",
            alignLabelWithHint: true,
            focusColor: AppColors.neutralLight,
            fillColor: AppColors.neutralLight,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                      Radius.circular(4)))),
        ),
      ),
    );
  }
}

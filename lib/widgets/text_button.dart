

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/view/360Group/group_3.dart';

class CostumTextButton extends StatelessWidget {
  const CostumTextButton({
    super.key,  this.title = AppText.button,
  });
final String title ;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(AppDimens.small),
      child: Container(
        width: double.infinity,
        height: size.height * 0.05,
        decoration: BoxDecoration(
              color: AppColors.neutralLight,
              border: Border.all(color: AppColors.neutralDark),
              borderRadius: BorderRadius.circular(4)),
        child: TextButton(
          onPressed: () {
              Get.to(const Group3());
            },
          child:   Center(
                child: Text(
              title,
              style: AppTextStyles.descriptionTitleStyle,
            )),
        ),
      ),
    );
  }
}

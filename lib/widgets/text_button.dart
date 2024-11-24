

import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';

class CostumTextButton extends StatelessWidget {
  const CostumTextButton({
    super.key,  this.title = AppText.button, this.onpress,
  });
final String title ;

final onpress ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimens.small),
      child: Container(
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
              color: AppColors.neutralLight,
              border: Border.all(color: AppColors.neutralDark),
              borderRadius: BorderRadius.circular(4)),
        child: TextButton(
          onPressed: onpress,
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

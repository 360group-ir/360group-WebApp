import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/text_button.dart';


class CostumBottomShit extends StatelessWidget {
  const CostumBottomShit({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4), topRight: Radius.circular(4))),
      height: size.height / 2.65,
      child: Padding(
        padding: const EdgeInsets.all(AppDimens.padding),
        child: Column(
          children: [
            Divider(
              height: 2,
              color: AppColors.neutralDark,
              indent: size.width * 0.36,
              endIndent: size.width * 0.36,
              thickness: 3,
            ),
            AppDimens.small.height,
            Row(
              children: [
                SvgPicture.asset(Assets.svg.icon1),
                AppDimens.medium.width,
                const Text(
                  AppText.address,
                  style: AppTextStyles.tileTxtStyle,
                )
              ],
            ),
            (size.height * 0.05).height,
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.addressSrb,
                maxLines: 3,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.tileChildrenStyle,
              ),
            ),
            (size.height * 0.05).height,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: Container(
                      width: size.width * 0.11,
                      height: size.width * 0.11,
                      decoration: BoxDecoration(
                          color: AppColors.neutralLight,
                          border: Border.all(color: AppColors.neutralDark),
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(child: SvgPicture.asset(Assets.svg.copy)),
                    )),
                const CostumTextButton(),
              ],
            )
          ],
        ),
      ),
    );
  }
}

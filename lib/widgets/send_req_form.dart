
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/app_colors.dart';
import 'package:service_360/component/res/app_text.dart';
import 'package:service_360/component/res/text_styles.dart';
import 'package:service_360/gen/assets.gen.dart';
import 'package:service_360/widgets/req_form_textFeild.dart';

class SendReqForm extends StatelessWidget {
  const SendReqForm({
    super.key, required this.uploadResume, required this.color,
  });
    final bool uploadResume;
    final Color color;
  @override
  Widget build(BuildContext context) {

    return Container(
      height: 429,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(AppDimens.padding),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.sendReq,
                style: AppTextStyles.descriptionTitleStyle,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          //Form
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.padding),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.sampleTex,
                style: AppTextStyles.sendReqTextFeildTitle,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const ReqFormTextfeild(hintText: 'نام و نام خانوادگی '),
          AppDimens.medium.height,
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.padding),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.sampleTex,
                style: AppTextStyles.sendReqTextFeildTitle,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const ReqFormTextfeild(hintText: ' شماره موبایل '),
          AppDimens.medium.height,
          const Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppDimens.padding),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                AppText.sampleTex,
                style: AppTextStyles.sendReqTextFeildTitle,
                textDirection: TextDirection.rtl,
              ),
            ),
          ),
          const ReqFormTextfeild(hintText: 'متن درخواست  '),
          AppDimens.medium.height,
          Visibility(
            visible: uploadResume,
            child: GestureDetector(
              onTap: () {},
              child: Center(
                child: Container(
                  height: 40,
                  width: 137,
                  decoration: BoxDecoration(
                      boxShadow: const [
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
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        AppText.upload,
                        style: AppTextStyles.tileChildrenStyle,
                      ),
                      AppDimens.medium.width,
                      SvgPicture.asset(Assets.svg.upload)
                    ],
                  ),
                ),
              ),
            ),
          ),
          AppDimens.medium.height,
          Container(
            height: 48,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
                horizontal: AppDimens.medium),
            decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(4)),
            child: TextButton(
              onPressed: () {},
              child: Text(
                AppText.send,
                style: AppTextStyles.landingPage
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

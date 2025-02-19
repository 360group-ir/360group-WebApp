import 'package:flutter/material.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/res/app_colors.dart';
import 'package:Group360/component/res/text_styles.dart';



class ReqFormTextfeild extends StatelessWidget {
   const ReqFormTextfeild({
    super.key,
    required this.hintText, required this.maxLin, required this.controller, required this.inputType,
  });
  final String hintText;
  final int maxLin ;
  final TextEditingController controller ;
  final TextInputType inputType ;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
           AppDimens.small ,AppDimens.padding,AppDimens.small,0),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal:  AppDimens.small) ,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
            color: AppColors.shadowColor,
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
          BoxShadow(
            color: AppColors.shadowColor1,
            offset: Offset(0, 1),
            blurRadius: 4,
          ),
          
        ]),
        child: TextField(
          controller: controller,
          textAlign: TextAlign.right,
          maxLines: maxLin,
          keyboardType:inputType ,
          decoration: InputDecoration(
              hintText: hintText,
              hintTextDirection: TextDirection.rtl,
              hintStyle: AppTextStyles.sendReqTextFeildHint,
              focusColor: AppColors.neutralLight,
              fillColor: AppColors.neutralLight,
              border: InputBorder.none),
        ),
      ),
    );
  }
}

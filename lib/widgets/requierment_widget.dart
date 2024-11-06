import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/extentions.dart';
import 'package:service_360/component/res/text_styles.dart';

class RequiermentList extends StatelessWidget {
   RequiermentList({
    super.key,
    // required List<String> items,
  }) ;


    final List<String> _items = [
    'تسلط کامل به HTML، CSS و JavaScript',
    'آشنایی با فریم‌ورک‌ها و کتابخانه‌ها: مانند React، Vue.js یا Angular',
    'آشنایی با CSS Preprocessors: مانند SASS یا LESS',
    'تجربه کار با ابزارهای مدیریت نسخه: مانند Git',
    'آشنایی با Build Tools: مانند Gulp، Webpack یا Parcel',
    'تسلط بر طراحی واکنش‌گرا (Responsive Design)',
    'آشنایی با Cross-browser Compatibility: حل ناسازگاری مرورگرها',
    'تجربه کار با ابزارهای طراحی UI/UX: مانند Figma، Sketch یا Adobe XD',
    'توانایی ایجاد انیمیشن و تعاملات کاربر',
    'مهارت‌های نرم: کار تیمی، مدیریت زمان و ارتباطات',
    'آشنایی با Progressive Web Apps (PWA)',
    '''دارای تجربه کاری مرتبط علاقه‌مند به یادگیری و به‌روز بودن با تکنولوژی‌های جدید''',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding),
        child: Column(
          children: [
            ListTile(
                minVerticalPadding: AppDimens.small,
                minTileHeight: 15,
                minLeadingWidth: 12,
                leading: const Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.black,
                ),
                title: Text(
                  _items[0],
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.descriptionStyle,
                ),
              ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[1],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[2],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[3],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[4],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[5],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[6],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[7],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[8],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[9],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[10],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            ListTile(
              minVerticalPadding: AppDimens.small,
              minTileHeight: 15,
              minLeadingWidth: 12,
              leading: const Icon(
                Icons.circle,
                size: 4,
                color: Colors.black,
              ),
              title: Text(
                _items[11],
                textDirection: TextDirection.rtl,
                style: AppTextStyles.descriptionStyle,
              ),
            ),
            AppDimens.padding.height
          ],
        ));
  }
}
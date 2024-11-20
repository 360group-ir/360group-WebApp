import 'package:flutter/material.dart';
import 'package:service_360/component/dimens.dart';
import 'package:service_360/component/res/text_styles.dart';

class RequiermentList extends StatelessWidget {
  const RequiermentList({
    super.key,
    required this.items,
  });
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
        child: SizedBox(
          // height: size.height * 0.6,
          child: ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // scroll Offs
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                minVerticalPadding: AppDimens.small,
                minTileHeight: 10,
                trailing: const Icon(
                  Icons.circle,
                  size: 4,
                  color: Colors.black,
                ),
                title: Text(
                  items[index],
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.descriptionStyle,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              );
            },
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:Group360/component/dimens.dart';
import 'package:Group360/component/res/text_styles.dart';

class RequiermentList extends StatelessWidget {
  const RequiermentList({
    super.key,
    required this.items,
  });
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding),
        child: SizedBox(
          child: ListView.builder(
            physics:
                const NeverScrollableScrollPhysics(), // scroll Offs
            shrinkWrap: true,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                titleAlignment: ListTileTitleAlignment.titleHeight,
                minVerticalPadding: AppDimens.small,
                minTileHeight: 10,
                trailing: const Icon(
                  CupertinoIcons.circle,
                  size: 6,
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

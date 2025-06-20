import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ChipsList extends StatelessWidget {
  final List<String> items;

  const ChipsList({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return Text(LocaleKeys.character_noData.watchTr(context));
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items
          .map(
            (String item) => Chip(
              label: Text(item),
              backgroundColor: AppColors.turquoise,
            ),
          )
          .toList(),
    );
  }
}

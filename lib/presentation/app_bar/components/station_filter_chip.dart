import 'package:flutter/material.dart';

class StationFilterChip extends StatelessWidget {
  const StationFilterChip({
    super.key,
    required this.text,
    required this.onTap,
    required this.dropdownItems,
  });

  final String text;
  final Function(String) onTap;
  final List<String> dropdownItems;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        final renderBox = context.findRenderObject()! as RenderBox;
        final offset = renderBox.localToGlobal(Offset.zero);
        final selectedItem = await showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            offset.dx,
            offset.dy + renderBox.size.height,
            offset.dx + renderBox.size.width,
            offset.dy,
          ),
          items: dropdownItems.map((item) {
            return PopupMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
        );

        if (selectedItem != null) {
          onTap(selectedItem);
        }
      },
      child: Chip(
        padding: const EdgeInsets.only(
          left: 8,
          top: 8,
          bottom: 8,
        ),
        label: Row(
          children: [
            Text(text),
            const Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}

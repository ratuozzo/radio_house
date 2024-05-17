import 'package:flutter/material.dart';

class StationTags extends StatelessWidget {
  const StationTags({
    super.key,
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          'Tags',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        Wrap(
          spacing: 8,
          runSpacing: 4,
          children: tags
              .map(
                (tag) => Chip(
                  label: Text(tag),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

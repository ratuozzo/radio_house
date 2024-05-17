import 'package:flutter/material.dart';

class StationImage extends StatelessWidget {
  const StationImage({
    super.key,
    required this.favicon,
    this.size,
  });

  final String favicon;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size ?? 50,
      width: size ?? 50,
      child: favicon.isEmpty
          ? Icon(
              Icons.not_interested,
              size: size ?? 35,
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                favicon,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.not_interested,
                    size: size ?? 35,
                  );
                },
              ),
            ),
    );
  }
}

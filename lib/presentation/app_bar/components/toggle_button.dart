import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton({
    super.key,
    required this.active,
    required this.onTap,
    required this.text,
  });

  final bool active;
  final VoidCallback onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: onTap,
            child: SizedBox(
              height: 35,
              width: MediaQuery.of(context).size.width * 0.5,
              child: Center(child: Text(text)),
            ),
          ),
          Container(
            height: 2,
            color: active ? Colors.grey : Colors.transparent,
          ),
        ],
      ),
    );
  }
}

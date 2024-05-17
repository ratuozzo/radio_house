import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool favorite;
  final VoidCallback onTap;

  const FavoriteButton({
    super.key,
    this.favorite = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconSize: 45,
      onPressed: onTap,
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child: Icon(
          favorite ? Icons.favorite : Icons.favorite_border,
          key: ValueKey<bool>(favorite),
          color: favorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}

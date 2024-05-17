import 'package:flutter/material.dart';

class PlayPauseButton extends StatefulWidget {
  const PlayPauseButton({
    super.key,
    required this.isPlaying,
    required this.loadingPlay,
    required this.onPressed,
    this.size,
  });

  final bool isPlaying;
  final bool loadingPlay;
  final VoidCallback onPressed;
  final double? size;

  @override
  State<PlayPauseButton> createState() => _PlayPauseButtonState();
}

class _PlayPauseButtonState extends State<PlayPauseButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    if (widget.isPlaying) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(PlayPauseButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPlaying) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.loadingPlay) {
      return const Padding(
        padding: EdgeInsets.only(right: 20),
        child: SizedBox(
          height: 30,
          width: 30,
          child: CircularProgressIndicator(),
        ),
      );
    }
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      iconSize: widget.size ?? 35,
      icon: AnimatedIcon(
        icon: AnimatedIcons.play_pause,
        progress: _controller,
      ),
      onPressed: widget.onPressed,
    );
  }
}

import 'package:flutter/material.dart';

class TextSlideTransitionWidget extends StatelessWidget {
  final Animation<double> animation;
  final String text1;
  final String text2;

  const TextSlideTransitionWidget({
    super.key,
    required this.animation,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final slideUp = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 1),
    ).animate(animation);
    final slideDown = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(animation);

    return Stack(
      children: [
        FadeTransition(
          opacity: animation,
          child: SlideTransition(position: slideDown, child: Text(text1)),
        ),
        FadeTransition(
          opacity: ReverseAnimation(animation),
          child: SlideTransition(position: slideUp, child: Text(text2)),
        ),
      ],
    );
  }
}

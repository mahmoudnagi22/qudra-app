import 'package:flutter/material.dart';
import 'package:qodraapp/core/utlis/app_colors.dart';

class TypingIndicator extends StatefulWidget {
  const TypingIndicator({super.key});

  @override
  State<TypingIndicator> createState() => _TypingIndicatorState();
}

class _TypingIndicatorState extends State<TypingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> dotOne;
  late Animation<double> dotTwo;
  late Animation<double> dotThree;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..repeat();

    dotOne = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.0, 0.3, curve: Curves.easeInOut)),
    );
    dotTwo = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.2, 0.5, curve: Curves.easeInOut)),
    );
    dotThree = Tween<double>(begin: 0, end: -5).animate(
      CurvedAnimation(
          parent: _controller,
          curve: const Interval(0.4, 0.7, curve: Curves.easeInOut)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: child,
        );
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: CircleAvatar(radius: 4, backgroundColor: AppColors.main),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        buildDot(dotOne),
        buildDot(dotTwo),
        buildDot(dotThree),
      ],
    );
  }
}

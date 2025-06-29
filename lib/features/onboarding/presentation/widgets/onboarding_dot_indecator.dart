import 'package:flutter/material.dart';

class OnboardingDotSIndecator extends StatelessWidget {
  final bool isActive;
  const OnboardingDotSIndecator({required this.isActive, super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 20),
      height: 10,
      width: isActive ? 20 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(milliseconds: 300),
    );
  }
}

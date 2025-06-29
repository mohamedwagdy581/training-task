// features/onboarding/view/widgets/get_started_button.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/utils/app_router.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('onBoardingScreen', true);

        if (context.mounted) {
          context.pushReplacementNamed(AppRoutes.register);
        }
      },
      child: const Text('Create Account'),
    );
  }
}

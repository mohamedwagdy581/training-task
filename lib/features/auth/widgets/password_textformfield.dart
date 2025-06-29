import 'package:flutter/material.dart';

class PasswordTextformfield extends StatelessWidget {
  final TextEditingController passwordController;
  final String lableText;
  final String? hintText;
  final IconData prefixIcon;
  final IconData suffixIcon;
  const PasswordTextformfield({
    super.key,
    required this.passwordController,
    required this.lableText,
    this.hintText,
    required this.prefixIcon,
    required this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter your password";
        } else if (value.length < 6) {
          return "Password must be at least 6 characters";
        }
        return null;
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: Text(lableText),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}

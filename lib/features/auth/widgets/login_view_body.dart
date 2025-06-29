import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/colors/app_colors.dart';
import '../../../core/helper/app_logger.dart';
import '../../../core/utils/app_router.dart';
import '../login/login_cubit/login_cubit.dart';
import 'custom_button.dart';
import 'custom_textformfield.dart';
import 'dont_have_account.dart';
import 'password_textformfield.dart';
import 'social_signing_row_button.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<LoginCubit>();
    final key = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.error),
              backgroundColor: AppColorScheme.error,
            ),
          );
          AppLogger.e(state.error);
        } else if (state is LoginSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Success"),
              backgroundColor: AppColorScheme.success,
            ),
          );
          context.go(AppRoutes.home);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(20.h),
          child: Form(
            key: key,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 50.h),
                  const Text(
                    "Login Account",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.h),
                  const Text(
                    "Please login with registered account",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  SizedBox(height: 35.h),
                  const Text(
                    "Email or Phone Number",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  CustomTextformfield(
                    controller: emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email";
                      }
                      // else if (!value.contains("@")) {
                      //   return "Please enter a valid email";
                      // }
                      return null;
                    },
                    lable: "Email",
                    prefixIcon: Icons.email_outlined,
                    hintText: "Enter your email",
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10.h),
                  PasswordTextformfield(
                    passwordController: passwordController,
                    lableText: "Password",
                    prefixIcon: Icons.fingerprint,
                    suffixIcon: Icons.visibility_off_outlined,
                    hintText: "Enter your password",
                  ),

                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forget your password?",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                  ),

                  SizedBox(height: 15.h),
                  state is LoginLoadingState
                      ? Center(child: const CircularProgressIndicator())
                      : CustomButton(
                          text: "Login",
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              cubit.login(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                        ),

                  SizedBox(height: 15.h),

                  DontHaveAccount(
                    onPressed: () {
                      context.go(AppRoutes.register);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.center,
                    child: const Text(
                      "Or using other methods",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),

                  SizedBox(height: 30.h),
                  // ***********************   Google Sign In Button   ***************
                  SocialSigningRowButton(
                    rowBackgroundColor: Colors.grey,
                    title: 'Connect with Google',
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.spMin,
                    ),
                    width: 10.w,
                    icon: Icons.email,
                    iconColor: Colors.red,
                    onPressed: () {
                      //LoginCubit.get(context).signInWithGoogle();
                    },
                  ),
                  SizedBox(height: 10.h),
                  // *********************   Facebook Sign In Button   ***************
                  SocialSigningRowButton(
                    rowBackgroundColor: Colors.grey,
                    title: 'Connect with Facebook',
                    titleStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.spMin,
                    ),
                    width: 10.w,
                    icon: Icons.facebook,
                    iconColor: Colors.blue,
                    onPressed: () {},
                  ),

                  // defaultSigningInRowButton(

                  // ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

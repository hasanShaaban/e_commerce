import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/signup_view_body.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'حساب جديد'),
      body:const SignupViewBody(),
    );
  }
}
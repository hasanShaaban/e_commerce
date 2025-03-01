import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(children: [
          const SizedBox(height: 24),
          const CustomTextFormField(hintText: 'الاسم كامل', textInputType: TextInputType.name),
          const SizedBox(height: 16),
          const CustomTextFormField(hintText: 'البريد الإلكتروني', textInputType: TextInputType.emailAddress),
          const SizedBox(height: 16),
          const CustomTextFormField(hintText: 'كلمة المرور', textInputType: TextInputType.visiblePassword, suffixIcon: Icon(Icons.remove_red_eye_rounded)),
          const SizedBox(height: 16),
          const TermsAndConditions(),
          const SizedBox(height: 30),
          CustomButton(onPressed: (){}, title: 'إنشاء حساب جديد'),
          const SizedBox(height: 26),
          const HaveAnAccountWidget()
        ]),
      ),
    );
  }
}
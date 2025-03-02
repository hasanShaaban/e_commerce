import 'package:e_commerce/core/functions/build_error_bar.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:e_commerce/feature/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, userName, password;
  late bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(children: [
            const SizedBox(height: 24),
            CustomTextFormField(
                onSaved: (value) {
                  userName = value!;
                },
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name),
            const SizedBox(height: 16),
            CustomTextFormField(
                onSaved: (value) {
                  email = value!;
                },
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 16),
            TermsAndConditions(
              onChanged: (value) {
                isTermsAccepted = value;
              },
            ),
            const SizedBox(height: 30),
            CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                              email, password, userName);
                    } else {
                      buildErrorBar(
                          context, 'يجب الموافقة على الشروط والأحكام');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: 'إنشاء حساب جديد'),
            const SizedBox(height: 26),
            const HaveAnAccountWidget()
          ]),
        ),
      ),
    );
  }
}

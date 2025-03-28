import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/core/widgets/password_field.dart';
import 'package:e_commerce/feature/auth/presentation/manager/singin_cubit/signin_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/social_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String password, email;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 24),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles.semiBold13
                        .copyWith(color: AppColors.lightPrimaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 33),
              CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signin(email, password);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: 'تسجيل دخول'),
              const SizedBox(height: 33),
              const DontHaveAnAccountWidget(),
              const SizedBox(height: 33),
              const OrDivider(),
              const SizedBox(height: 16),
              SocialButton(
                  onPressed: () {
                    context.read<SigninCubit>().signInWithGoogle();
                  },
                  title: 'تسجيل بواسطة جوجل',
                  image: Assets.imagesGoogleIcon),
              const SizedBox(height: 16),
              SocialButton(
                  onPressed: () {},
                  title: 'تسجيل بواسطة أبل',
                  image: Assets.imagesAppleIcon),
              const SizedBox(height: 16),
              SocialButton(
                  onPressed: () {},
                  title: 'تسجيل بواسطة فيسبوك',
                  image: Assets.imagesFacebookIcon),
            ],
          ),
        ),
      ),
    );
  }
}

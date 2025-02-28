import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/core/utils/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/social_button.dart';
import 'package:flutter/material.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            const CustomTextFormField(
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress),
            const SizedBox(height: 16),
            const CustomTextFormField(
                hintText: 'كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                suffixIcon: Icon(Icons.remove_red_eye)),
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
            CustomButton(onPressed: () {}, title: 'تسجيل دخول'),
            const SizedBox(height: 33),
            const DontHaveAnAccountWidget(),
            const SizedBox(height: 33),
            const OrDivider(),
            const SizedBox(height: 16),
            SocialButton(
                onPressed: () {},
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
    );
  }
}

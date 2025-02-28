import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class DontHaveAnAccountWidget extends StatelessWidget {
  const DontHaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: ' لا تمتلك حساب؟',
          style: AppTextStyles.semiBold16
              .copyWith(color: const Color(0xFF949D9E))),
      TextSpan(
          text: 'قم بإنشاء حساب',
          style: AppTextStyles.semiBold16
              .copyWith(color: AppColors.primaryColor)),
    ]));
  }
}
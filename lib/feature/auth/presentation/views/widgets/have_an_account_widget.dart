import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class HaveAnAccountWidget extends StatelessWidget {
  const HaveAnAccountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: ' تمتلك حساب بالفعل؟',
          style: AppTextStyles.semiBold16
              .copyWith(color: const Color(0xFF949D9E))),
      TextSpan(
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              Navigator.pop(context);
            },
          text: 'تسجيل دخول',
          style:
              AppTextStyles.semiBold16.copyWith(color: AppColors.primaryColor)),
    ]));
  }
}

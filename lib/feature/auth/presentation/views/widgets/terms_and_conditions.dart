import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/custom_check_box.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatefulWidget {
  const TermsAndConditions({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isTermsAccepted,
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text.rich(TextSpan(children: [
            TextSpan(
                text: 'من خلال إنشاء حساب ، فإنك توافق على',
                style: AppTextStyles.semiBold13
                    .copyWith(color: const Color(0xFF949D9E))),
            TextSpan(
                text: ' الشروط والأحكام الخاصة بنا',
                style: AppTextStyles.semiBold13
                    .copyWith(color: AppColors.lightPrimaryColor))
          ])),
        )
      ],
    );
  }
}

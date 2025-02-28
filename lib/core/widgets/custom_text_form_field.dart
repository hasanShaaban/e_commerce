import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({super.key, required this.hintText, this.suffixIcon, required this.textInputType});
  final String hintText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.bold13.copyWith(
          color:const Color(0xFF949D9E)
        ),
        suffixIcon: suffixIcon,
        suffixIconColor:const Color(0xFFC9CECF),
        filled: true,
        fillColor:const Color(0xFFF9FAFA),
        border: buildBorder(),
        enabledBorder: buildBorder()
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide:const BorderSide(
          width: 1,
          color: Color(0xFFE6E9EA)
        )
      );
  }
}
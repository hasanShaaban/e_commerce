import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved,
  });
  final void Function(String?)? onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
      hintText: 'كلمة المرور',
      textInputType: TextInputType.visiblePassword,
      suffixIcon: GestureDetector(
        onTap: () {
          obscureText = !obscureText;
          setState(() {});
        },
        child: obscureText
            ? const Icon(Icons.visibility_off_rounded)
            : const Icon(Icons.remove_red_eye_rounded),
      ),
    );
  }
}

import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  const SocialButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.image});
  final VoidCallback onPressed;
  final String title;
  final String image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
          style: TextButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: const BorderSide(color: Color(0xFFDDDFDF), width: 1))),
          onPressed: onPressed,
          child: ListTile(
            visualDensity:
                const VisualDensity(vertical: VisualDensity.minimumDensity),
            leading: SvgPicture.asset(image),
            title: Text(
              title,
              style: AppTextStyles.semiBold16,
              textAlign: TextAlign.center,
            ),
          )),
    );
  }
}

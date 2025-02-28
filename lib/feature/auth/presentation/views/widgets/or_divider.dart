import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFDDDFDF))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text('أو', style: AppTextStyles.semiBold16,),
        ),
        Expanded(child: Divider(color: Color(0xFFDDDFDF))),
      ],
    );
  }
}
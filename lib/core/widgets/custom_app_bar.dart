import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, {required String title}) {
    return AppBar(
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back_ios_new)),
      centerTitle: true,
      backgroundColor: Colors.white,
      title: Text(
        title,
        style: AppTextStyles.bold19,
        textAlign: TextAlign.center,
      ),
    );
  }
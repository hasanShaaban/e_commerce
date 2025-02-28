import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem(
      {super.key,
      required this.image,
      required this.background,
      required this.subTitle,
      required this.title, required this.isVisible});

  final String image, background, subTitle;
  final Widget title;
  final bool isVisible;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .5,
          child: Stack(
            children: [
              Positioned.fill(
                  child: SvgPicture.asset(
                background,
                fit: BoxFit.fill,
              )),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(
                  image,
                ),
              ),
              Visibility(
                visible: isVisible,
                child: Padding(
                  padding:const EdgeInsets.all(16.0),
                  child: Text('تخط', style: TextStyles.regular13.copyWith(color: const Color(0xFF949D9E)),),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 47),

        title,
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(subTitle, textAlign: TextAlign.center,style: TextStyles.semiBold13,),
        ),
      ],
    );
  }
}

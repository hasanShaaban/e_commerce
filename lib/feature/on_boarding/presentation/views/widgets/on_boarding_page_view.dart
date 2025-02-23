import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/feature/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: const [
        PageViewItem(
            image: Assets.imagesPageViewItem1Image,
            background: Assets.imagesPageViewItem1BackgroundImage,
            subTitle: 'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
            title: Row(
              children: [
                Text('مرحبًا بك في'),
                Text('Fruit'),
                Text('HUB'),
              ],
            ))
      ],
    );
  }
}

import 'package:e_commerce/core/utils/app_colors.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/utils/app_text_styles.dart';
import 'package:e_commerce/feature/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          isVisible: true ,
          image: Assets.imagesPageViewItem1Image,
          background: Assets.imagesPageViewItem1BackgroundImage,
          subTitle:
              'اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
          title:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('مرحبًا بك في', style:AppTextStyles.bold23),
              Text(' HUB',style:AppTextStyles.bold23.copyWith(color: AppColors.primaryColor)),
              Text('Fruit',style:AppTextStyles.bold23.copyWith(color: AppColors.secondaryColor)),
              
            ],
          ),
        ),
        const PageViewItem(
          isVisible: false,
          image: Assets.imagesPageViewItem2Image,
          background: Assets.imagesPageViewItem2BackgroundImage,
          subTitle:
              'نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية',
          title:Text('ابحث وتسوق', style: AppTextStyles.bold23,),
        ),
      ],
    );
  }
}

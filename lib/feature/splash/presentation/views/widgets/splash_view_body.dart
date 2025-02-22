import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/feature/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.imagesPlant),
          ],
        ),
        SvgPicture.asset(Assets.imagesFruithub),
        SvgPicture.asset(Assets.imagesPubbles, fit: BoxFit.fill,)
      
      ],
    );
  }
  
  void excuteNavigation() {
    Future.delayed(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
    });
  }
}
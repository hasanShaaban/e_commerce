import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/feature/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String routeName = 'signup';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(getIt<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'حساب جديد'),
        body: const SignupViewBodyBlocConsumer(),
      ),
    );
  }
}


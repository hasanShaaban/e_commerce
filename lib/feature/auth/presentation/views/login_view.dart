import 'package:e_commerce/core/services/get_it_service.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/feature/auth/presentation/manager/singin_cubit/signin_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        appBar: buildAppBar(context, title: 'تسجيل دخول'),
        body:const LoginViewBodyBlocConsumer(),
      ),
    );
  }
}


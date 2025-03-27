import 'package:e_commerce/core/functions/build_error_bar.dart';
import 'package:e_commerce/core/widgets/custom_progress_hud.dart';
import 'package:e_commerce/feature/auth/presentation/manager/singin_cubit/signin_cubit.dart';
import 'package:e_commerce/feature/auth/presentation/views/widgets/login_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; 

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if(state is SigninFailuer){
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is SigninLoading ? true : false,
            child: const LoginViewBody());
      },
    );
  }
}

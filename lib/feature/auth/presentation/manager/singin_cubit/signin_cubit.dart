
import 'package:e_commerce/feature/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;

  Future<void> signin(String email, String password) async{
    emit(SigninLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((failuer) => emit(SigninFailuer(message: failuer.message)),
    (userEntity) => emit(SigninSuccess(userEntity: userEntity))
    );
  }

  Future<void> signInWithGoogle() async{
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
      (failuer) => emit(SigninFailuer(message: failuer.message)),
      (response) => emit(SigninSuccess(userEntity: response)));
  }
}

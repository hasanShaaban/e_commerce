import 'package:e_commerce/feature/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/feature/auth/domain/repos/auth_repo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(String email, String password, String name)async{
    emit(SignupLoading());
    final result = await authRepo.createUserWithEmailAndPassword(email, password, name);

    result.fold(
      (failuer) => emit(SignupFailure(message: failuer.message)),
      (userEntity) => emit(SignupSuccess(user: userEntity))
      );
  }
}

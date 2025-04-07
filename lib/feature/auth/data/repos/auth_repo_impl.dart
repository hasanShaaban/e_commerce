import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/exceptions.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/core/services/firebase_auth_service.dart';
import 'package:e_commerce/feature/auth/data/models/user_model.dart';
import 'package:e_commerce/feature/auth/domain/entity/user_entity.dart';
import 'package:e_commerce/feature/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImpl({required this.firebaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailuer(e.message));
    } catch (e) {
      log('Excetion in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
          email: email, password: password);
      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(ServerFailuer(e.message));
    } catch (e) {
      log('Excetion in AuthRepoImpl.createUserWithEmailAndPassword : ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithGoogle : ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log('Exception in AuthRepoImpl.signInWithFacebook : ${e.toString()}');
      return left(ServerFailuer('هناك خطأ ما, حاول مرة اخرى لاحقا'));
    }
  }
}

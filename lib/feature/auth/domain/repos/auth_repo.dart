import 'package:dartz/dartz.dart';
import 'package:e_commerce/core/errors/failures.dart';
import 'package:e_commerce/feature/auth/domain/entity/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword(String email, String password, String name);

  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(String email, String password);

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future addUserData({required UserEntity user});
}


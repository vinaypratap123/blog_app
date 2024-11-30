import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  ///.... sign up with email and password
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  });

  ///.... login with email and password
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

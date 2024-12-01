import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';
import 'package:blog_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoryImpl(this._authRemoteDataSource);

  ///.... login with email and password
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) {
    _authRemoteDataSource.loginWithEmailPassword(
      email: email,
      password: password,
    );
    throw UnimplementedError();
  }

  ///.... sign up with email and password
  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authRemoteDataSource.signUpWithEmailPassword(
        fullName: fullName,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerException catch (error) {
      return left(Failure(error.message));
    }
  }
}

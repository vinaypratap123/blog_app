import 'package:blog_app/core/constants/string_constants.dart';
import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/network/network_info.dart';
import 'package:blog_app/feature/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';
import 'package:blog_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoryImpl(
    this._authRemoteDataSource,
    this.networkInfo,
  );

  ///.... login with email and password
  @override
  Future<Either<Failure, UserEntity>> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        final user = await _authRemoteDataSource.loginWithEmailPassword(
          email: email,
          password: password,
        );
        return right(user);
      } on ServerException catch (error) {
        return left(Failure(error.message));
      }
    } else {
      return left(Failure(StringConstants.noInternetConnection));
    }
  }

  ///.... sign up with email and password
  @override
  Future<Either<Failure, UserEntity>> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    if (await networkInfo.isConnected) {
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
    } else {
      return left(Failure(StringConstants.noInternetConnection));
    }
  }
}

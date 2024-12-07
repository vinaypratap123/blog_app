import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';
import 'package:blog_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignInUsecase implements Usecase<UserEntity, UserSignInParams> {
  final AuthRepository _authRepository;
  UserSignInUsecase(this._authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(UserSignInParams params) async {
    return await _authRepository.loginWithEmailPassword(
      email: params.email,
      password: params.password,
    );
  }
}

///....user sign up parameters
class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}

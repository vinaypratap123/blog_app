import 'package:blog_app/core/error/failure.dart';
import 'package:blog_app/core/usecase/usecase.dart';
import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';
import 'package:blog_app/feature/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class UserSignUpUsecase implements Usecase<UserEntity, UserSignUpParams> {
  final AuthRepository _authRepository;

  UserSignUpUsecase(this._authRepository);
  @override
  Future<Either<Failure, UserEntity>> call(UserSignUpParams params) async {
    return await _authRepository.signUpWithEmailPassword(
      fullName: params.fullName,
      email: params.email,
      password: params.password,
    );
  }
}

///....user sign up parameters
class UserSignUpParams {
  final String fullName;
  final String email;
  final String password;

  UserSignUpParams({
    required this.fullName,
    required this.email,
    required this.password,
  });
}

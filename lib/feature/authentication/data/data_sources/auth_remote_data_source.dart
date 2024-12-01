import 'package:blog_app/feature/authentication/data/model/user_model.dart';

abstract interface class AuthRemoteDataSource {
  ///.... signup with email and password
  Future<UserModel> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  });

  ///.... login with email and password
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

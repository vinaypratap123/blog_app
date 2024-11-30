abstract interface class AuthRemoteDataSource {
  ///.... signup with email and password
  Future<String> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  });

  ///.... login with email and password
  Future<String> loginWithEmailPassword({
    required String email,
    required String password,
  });
}

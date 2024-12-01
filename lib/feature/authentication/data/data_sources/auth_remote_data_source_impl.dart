import 'package:blog_app/core/error/exception.dart';
import 'package:blog_app/feature/authentication/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;

  AuthRemoteDataSourceImpl(this.supabaseClient);

  ///.... login with email and password
  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    debugPrint('loginWithEmailPassword start with....');
    debugPrint('email:$email');
    debugPrint('password:$password');
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        email: email,
        password: password,
      );

      debugPrint('response:${response.user}');
      if (response.user != null) {
        debugPrint('userId:${response.user!.id}');
        return UserModel.fromJson(response.user!.toJson());
      } else {
        debugPrint('User is Null');
        throw ServerException('User is Null');
      }
    } catch (error) {
      debugPrint('catch error: ${error.toString()}');
      throw ServerException(error.toString());
    }
  }

  ///.... signup with email and password
  @override
  Future<UserModel> signUpWithEmailPassword({
    required String fullName,
    required String email,
    required String password,
  }) async {
    debugPrint('signUpWithEmailPassword start with....');
    debugPrint('fullName:$fullName');
    debugPrint('email:$email');
    debugPrint('password:$password');

    try {
      final response = await supabaseClient.auth.signUp(
        email: email,
        password: password,
        data: {
          'fullName': fullName,
        },
      );

      debugPrint('response:${response.user}');
      if (response.user != null) {
        debugPrint('userId:${response.user!.id}');
        return UserModel.fromJson(response.user!.toJson());
      } else {
        debugPrint('User is Null');
        throw ServerException('User is Null');
      }
    } catch (error) {
      debugPrint('catch error: ${error.toString()}');
      throw ServerException(error.toString());
    }
  }
}

import 'package:blog_app/feature/authentication/domain/entity/user_entity.dart';
import 'package:blog_app/feature/authentication/domain/usecases/user_sign_in_usecase.dart';
import 'package:blog_app/feature/authentication/domain/usecases/user_sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUpUsecase _userSignUpUsecase;
  final UserSignInUsecase _userSignInUsecase;
  AuthBloc({
    required UserSignUpUsecase userSignUpUsecase,
    required UserSignInUsecase userSignInUsecase,
  })  : _userSignUpUsecase = userSignUpUsecase,
        _userSignInUsecase = userSignInUsecase,
        super(AuthInitial()) {
    on<AuthSignUpEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final response = await _userSignUpUsecase(
          UserSignUpParams(
            fullName: event.fullName,
            email: event.email,
            password: event.password,
          ),
        );
        response.fold(
          (error) {
            emit(AuthFailure(error.message));
          },
          (user) {
            emit(AuthSuccess(user));
          },
        );
      },
    );
    on<AuthSignInEvent>(
      (event, emit) async {
        emit(AuthLoading());
        final response = await _userSignInUsecase(
          UserSignInParams(
            email: event.email,
            password: event.password,
          ),
        );
        response.fold(
          (error) {
            emit(AuthFailure(error.message));
          },
          (user) {
            emit(AuthSuccess(user));
          },
        );
      },
    );
  }
}

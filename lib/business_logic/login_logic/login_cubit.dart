import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/helpers/toast_message.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool showPass = true;

  void showOrHidePassword() {
    showPass = !showPass;
    emit(ShowOrHidePasswordState());
  }

  void loginUser({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(LoginSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        toast(msg: 'Email is wrong');
        emit(LoginErrorState());
      } else if (e.code == 'wrong-password') {
        toast(msg: 'Password is wrong');
        emit(LoginErrorState());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(LoginErrorState());
    }
  }
}

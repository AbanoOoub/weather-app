import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/constants/strings.dart';
import 'package:weather_app/data/helpers/shared_prefs.dart';

import '../../data/helpers/toast_message.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool showPass = true;

  void showOrHidePassword() {
    showPass = !showPass;
    emit(ShowOrHidePasswordState());
  }

  void registerNewUser(
      {required String name, required String email, required String password}) async {
    emit(RegisterLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      CacheHelper.saveData(key: userNameKey,val: name);
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toast(msg: "Write Strong Password");
        emit(RegisterErrorState());
      } else if (e.code == 'email-already-in-use') {
        toast(msg: "Email Exists");
        emit(RegisterErrorState());
      }
    } catch (e) {
      debugPrint(e.toString());
      emit(RegisterErrorState());
    }
  }

}

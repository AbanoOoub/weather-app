import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/data/helpers/shared_prefs.dart';

import '../../data/constants/strings.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  bool showPass = true;

  String userName = '';
  String userCountry = '';
  String userEmail = '';
  String userPassword = '*******';

  void showOrHidePassword() {
    showPass = !showPass;
    emit(ShowOrHidePasswordState());
  }

  void initProfileData() {
    userName = CacheHelper.getData(key: userNameKey) ?? 'Full Name';
    userEmail = FirebaseAuth.instance.currentUser!.email!;
    userCountry = CacheHelper.getData(key: userLocationKey) ?? 'Egypt';
  }

  void updateProfileData(
      {required String newName,
      required String newEmail,
      required String newPassword,
      required String newLocation})  async{
    emit(UpdateLoadingState());
    if (newName.isNotEmpty) {
      CacheHelper.saveData(key: userNameKey, val: newName);
    }
    if (newEmail.isNotEmpty) {
      await FirebaseAuth.instance.currentUser!.updateEmail(newEmail);
    }
    if (newPassword.isNotEmpty){
      await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
    }
    if (newLocation.isNotEmpty) {
      CacheHelper.saveData(key: userLocationKey, val: newLocation);
    }
    FirebaseAuth.instance.signOut();
    emit(UpdateSuccessState());
  }
}

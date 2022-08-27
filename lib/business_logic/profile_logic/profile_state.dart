part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ShowOrHidePasswordState extends ProfileState {}

class ChangeNameStatusState extends ProfileState {}

class UpdateLoadingState extends ProfileState {}

class UpdateSuccessState extends ProfileState {}

part of 'current_user_cubit.dart';

@immutable
abstract class CurrentUserState {}

class CurrentUserInitial extends CurrentUserState {}
class CurrentUserError extends CurrentUserState {
  final String message;

  CurrentUserError({required this.message});
}
class CurrentUserLoading extends CurrentUserState {}
class CurrentUserSaved extends CurrentUserState {}
class CurrentUserLoaded extends CurrentUserState {
  final UserEntity user;

  CurrentUserLoaded(this.user);
}

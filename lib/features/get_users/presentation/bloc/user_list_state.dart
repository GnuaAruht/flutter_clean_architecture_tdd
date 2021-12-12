part of 'user_list_bloc.dart';

@freezed
class UserListState with _$UserListState {
  const factory UserListState.initial() = _Initial;
  const factory UserListState.loading() = _Loading;
  const factory UserListState.loaded(List<User> userList) = _Loaded;
  const factory UserListState.error(String message) = _Error;
}

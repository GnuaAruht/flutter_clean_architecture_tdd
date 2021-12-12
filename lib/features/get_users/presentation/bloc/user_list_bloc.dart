import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_list_usecase.dart';

part 'user_list_bloc.freezed.dart';
part 'user_list_event.dart';
part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  final GetUserListUseCase getUserListUseCase;

  UserListBloc(this.getUserListUseCase) : super(const _Initial()) {
    on<_LoadUserList>((event, emit) async {
      emit(const _Loading());
      final result = await getUserListUseCase(NoParam());
      result.fold((failure) async => emit(const _Error('Server Failure')),
          (userList) async => emit(_Loaded(userList)));
    });
  }
}

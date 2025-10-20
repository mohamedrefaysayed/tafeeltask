import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_users.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final GetUsers getUsers;

  UsersCubit({required this.getUsers}) : super(UsersInitial());

  int _currentPage = 1;
  bool _hasMorePages = true;
  final List<User> _allUsers = [];

  Future<void> loadUsers({bool isRefresh = false}) async {
    if (isRefresh) {
      _currentPage = 1;
      _allUsers.clear();
      _hasMorePages = true;
      emit(UsersLoading());
    } else {
      if (!_hasMorePages) return;
      // Prevent multiple simultaneous requests
      if (state is UsersLoading || state is UsersLoadingMore) return;

      if (_allUsers.isNotEmpty) {
        emit(UsersLoadingMore(_allUsers));
      } else {
        emit(UsersLoading());
      }
    }

    final result = await getUsers(GetUsersParams(page: _currentPage));

    result.fold(
      (failure) {
        emit(UsersError(failure.message, _allUsers));
      },
      (response) {
        _allUsers.addAll(response.users);
        _hasMorePages = response.hasMorePages;
        _currentPage++;
        emit(
          UsersLoaded(users: List.from(_allUsers), hasMorePages: _hasMorePages),
        );
      },
    );
  }

  Future<void> refreshUsers() async {
    await loadUsers(isRefresh: true);
  }
}

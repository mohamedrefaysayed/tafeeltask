part of 'users_cubit.dart';

abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoadingMore extends UsersState {
  final List<User> currentUsers;

  const UsersLoadingMore(this.currentUsers);

  @override
  List<Object> get props => [currentUsers];
}

class UsersLoaded extends UsersState {
  final List<User> users;
  final bool hasMorePages;

  const UsersLoaded({required this.users, required this.hasMorePages});

  @override
  List<Object> get props => [users, hasMorePages];
}

class UsersError extends UsersState {
  final String message;
  final List<User> currentUsers;

  const UsersError(this.message, this.currentUsers);

  @override
  List<Object> get props => [message, currentUsers];
}

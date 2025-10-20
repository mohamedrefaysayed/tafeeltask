import 'package:equatable/equatable.dart';
import 'user.dart';

class UsersResponse extends Equatable {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> users;

  const UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
  });

  bool get hasMorePages => page < totalPages;

  @override
  List<Object> get props => [page, perPage, total, totalPages, users];
}

import '../../domain/entities/users_response.dart';
import 'user_model.dart';

class UsersResponseModel extends UsersResponse {
  const UsersResponseModel({
    required super.page,
    required super.perPage,
    required super.total,
    required super.totalPages,
    required super.users,
  });

  factory UsersResponseModel.fromJson(Map<String, dynamic> json) {
    return UsersResponseModel(
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
      users: (json['data'] as List)
          .map((userJson) => UserModel.fromJson(userJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'total': total,
      'total_pages': totalPages,
      'data': users.map((user) {
        return {
          'id': user.id,
          'email': user.email,
          'first_name': user.firstName,
          'last_name': user.lastName,
          'avatar': user.avatar,
        };
      }).toList(),
    };
  }

  UsersResponse toEntity() {
    return UsersResponse(
      page: page,
      perPage: perPage,
      total: total,
      totalPages: totalPages,
      users: users,
    );
  }
}

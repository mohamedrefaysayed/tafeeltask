import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user.dart';
import '../entities/users_response.dart';

abstract class UserRepository {
  Future<Either<Failure, UsersResponse>> getUsers(int page);
  Future<Either<Failure, User>> getUserById(int userId);
}

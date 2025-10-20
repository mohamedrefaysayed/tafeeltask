import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/users_response.dart';
import '../repositories/user_repository.dart';

class GetUsers implements UseCase<UsersResponse, GetUsersParams> {
  final UserRepository repository;

  GetUsers(this.repository);

  @override
  Future<Either<Failure, UsersResponse>> call(GetUsersParams params) async {
    return await repository.getUsers(params.page);
  }
}

class GetUsersParams {
  final int page;

  GetUsersParams({required this.page});
}

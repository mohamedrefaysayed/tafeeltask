import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/get_user_by_id.dart';

part 'user_detail_state.dart';

class UserDetailCubit extends Cubit<UserDetailState> {
  final GetUserById getUserById;

  UserDetailCubit({required this.getUserById}) : super(UserDetailInitial());

  Future<void> loadUserDetail(int userId) async {
    print('🔍 Loading user detail for ID: $userId');
    emit(UserDetailLoading());

    final result = await getUserById(GetUserByIdParams(userId: userId));

    result.fold(
      (failure) {
        print('❌ Error loading user $userId: ${failure.message}');
        emit(UserDetailError(failure.message));
      },
      (user) {
        print('✅ Successfully loaded user $userId: ${user.fullName}');
        emit(UserDetailLoaded(user));
      },
    );
  }
}

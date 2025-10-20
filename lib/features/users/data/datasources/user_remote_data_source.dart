import 'package:dio/dio.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/user_model.dart';
import '../models/users_response_model.dart';

abstract class UserRemoteDataSource {
  Future<UsersResponseModel> getUsers(int page);
  Future<UserModel> getUserById(int userId);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiClient apiClient;

  UserRemoteDataSourceImpl({required this.apiClient});

  @override
  Future<UsersResponseModel> getUsers(int page) async {
    try {
      final response = await apiClient.get(
        '/users',
        queryParameters: {'page': page},
      );

      if (response.statusCode == 200) {
        return UsersResponseModel.fromJson(response.data);
      } else {
        // Try to extract error message from response
        final errorMsg =
            response.data?['error'] ??
            'Failed to load users. Status code: ${response.statusCode}';
        throw ServerException(errorMsg);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException('Network connection failed');
      } else if (e.response != null) {
        // Try to extract error message from error response
        final errorMsg =
            e.response?.data?['error'] ??
            e.response?.data?['message'] ??
            'Server error: ${e.response?.statusCode}';
        throw ServerException(errorMsg);
      } else {
        throw ServerException('Unexpected error occurred');
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Failed to load users: $e');
    }
  }

  @override
  Future<UserModel> getUserById(int userId) async {
    try {
      final response = await apiClient.get('/users/$userId');

      if (response.statusCode == 200) {
        // Check if data exists and has the 'data' field
        if (response.data == null) {
          throw ServerException(
            'No data received from server for user $userId',
          );
        }

        if (response.data['data'] == null) {
          throw ServerException('User data is null for user $userId');
        }

        return UserModel.fromJson(response.data['data']);
      } else {
        // Try to extract error message from response
        final errorMsg =
            response.data?['error'] ??
            'Failed to load user $userId. Status code: ${response.statusCode}';
        throw ServerException(errorMsg);
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.connectionError) {
        throw NetworkException('Network connection failed for user $userId');
      } else if (e.response != null) {
        // Try to extract error message from error response
        final errorMsg =
            e.response?.data?['error'] ??
            e.response?.data?['message'] ??
            'Server error for user $userId: ${e.response?.statusCode}';
        throw ServerException(errorMsg);
      } else {
        throw ServerException(
          'Unexpected error occurred while loading user $userId',
        );
      }
    } catch (e) {
      if (e is ServerException || e is NetworkException) {
        rethrow;
      }
      throw ServerException('Failed to load user $userId: ${e.toString()}');
    }
  }
}

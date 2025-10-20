import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import 'user_card.dart';

/// Users list builder component
class UsersListBuilder extends StatelessWidget {
  final List<User> users;
  final bool hasMorePages;
  final bool isLoadingMore;
  final String? errorMessage;
  final VoidCallback onRetry;
  final Function(User) onUserTap;

  const UsersListBuilder({
    super.key,
    required this.users,
    required this.hasMorePages,
    required this.isLoadingMore,
    this.errorMessage,
    required this.onRetry,
    required this.onUserTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          if (index == users.length) {
            if (errorMessage != null) {
              return _PaginationError(message: errorMessage!, onRetry: onRetry);
            }
            return const _PaginationLoading();
          }

          final user = users[index];
          return UserCard(user: user, onTap: () => onUserTap(user));
        }, childCount: users.length + (hasMorePages || isLoadingMore ? 1 : 0)),
      ),
    );
  }
}

class _PaginationError extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _PaginationError({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red[300]),
          ),
          const SizedBox(height: 8),
          ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
        ],
      ),
    );
  }
}

class _PaginationLoading extends StatelessWidget {
  const _PaginationLoading();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }
}

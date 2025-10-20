import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../cubit/users_cubit.dart';
import '../widgets/error_display.dart';
import '../widgets/shimmer_loading.dart';
import '../widgets/users_app_bar.dart';
import '../widgets/users_list_builder.dart';
import 'user_detail_page.dart';

class UsersListPage extends StatelessWidget {
  const UsersListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UsersCubit>()..loadUsers(),
      child: const UsersListView(),
    );
  }
}

class UsersListView extends StatefulWidget {
  const UsersListView({super.key});

  @override
  State<UsersListView> createState() => _UsersListViewState();
}

class _UsersListViewState extends State<UsersListView> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isLoadingMore) return;

    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent * 0.9) {
      _isLoadingMore = true;
      context.read<UsersCubit>().loadUsers();

      // Reset flag after a short delay to allow next load
      Future.delayed(const Duration(milliseconds: 500), () {
        if (mounted) {
          setState(() {
            _isLoadingMore = false;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is UsersLoading) {
            return CustomScrollView(
              slivers: [
                const UsersAppBar(userCount: 0),
                const SliverFillRemaining(child: UserListShimmer()),
              ],
            );
          }

          if (state is UsersError && state.currentUsers.isEmpty) {
            return CustomScrollView(
              slivers: [
                const UsersAppBar(userCount: 0),
                SliverFillRemaining(
                  child: ErrorDisplay(
                    message: state.message,
                    onRetry: () => context.read<UsersCubit>().refreshUsers(),
                  ),
                ),
              ],
            );
          }

          if (state is UsersLoaded ||
              state is UsersLoadingMore ||
              (state is UsersError && state.currentUsers.isNotEmpty)) {
            final users = state is UsersLoaded
                ? state.users
                : state is UsersLoadingMore
                ? state.currentUsers
                : (state as UsersError).currentUsers;

            final hasMorePages = state is UsersLoaded
                ? state.hasMorePages
                : true;
            final isLoadingMore = state is UsersLoadingMore;
            final errorState = state is UsersError ? state : null;

            return RefreshIndicator(
              onRefresh: () => context.read<UsersCubit>().refreshUsers(),
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  UsersAppBar(userCount: users.length),
                  UsersListBuilder(
                    users: users,
                    hasMorePages: hasMorePages,
                    isLoadingMore: isLoadingMore,
                    errorMessage: errorState?.message,
                    onRetry: () => context.read<UsersCubit>().loadUsers(),
                    onUserTap: (user) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserDetailPage(user: user),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

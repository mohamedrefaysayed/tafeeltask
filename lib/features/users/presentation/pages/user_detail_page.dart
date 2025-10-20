import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection_container.dart';
import '../../domain/entities/user.dart';
import '../cubit/user_detail_cubit.dart';
import '../widgets/shimmer_loading.dart';
import '../widgets/user_detail_app_bar.dart';
import '../widgets/user_detail_error.dart' as error_widget;
import '../widgets/user_email_card.dart';
import '../widgets/user_information_section.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserDetailCubit>()..loadUserDetail(user.id),
      child: UserDetailView(user: user),
    );
  }
}

class UserDetailView extends StatelessWidget {
  final User user;

  const UserDetailView({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: BlocBuilder<UserDetailCubit, UserDetailState>(
        builder: (context, state) {
          if (state is UserDetailLoading) {
            return const UserDetailShimmer();
          }

          if (state is UserDetailError) {
            return error_widget.UserDetailError(
              message: state.message,
              onRetry: () =>
                  context.read<UserDetailCubit>().loadUserDetail(user.id),
            );
          }

          if (state is UserDetailLoaded) {
            final detailedUser = state.user;
            return CustomScrollView(
              slivers: [
                UserDetailAppBar(user: detailedUser),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UserEmailCard(user: detailedUser),
                        const SizedBox(height: 24),
                        UserInformationSection(user: detailedUser),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import 'user_info_card.dart';

/// User information section with all info cards
class UserInformationSection extends StatelessWidget {
  final User user;

  const UserInformationSection({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'User Information',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        const SizedBox(height: 16),
        UserInfoCard(
          icon: Icons.badge_outlined,
          title: 'User ID',
          value: '#${user.id}',
          gradientColors: [Colors.blue.shade400, Colors.blue.shade600],
        ),
        const SizedBox(height: 12),
        UserInfoCard(
          icon: Icons.person_rounded,
          title: 'First Name',
          value: user.firstName,
          gradientColors: [Colors.purple.shade400, Colors.purple.shade600],
        ),
        const SizedBox(height: 12),
        UserInfoCard(
          icon: Icons.person_outline_rounded,
          title: 'Last Name',
          value: user.lastName,
          gradientColors: [Colors.pink.shade400, Colors.pink.shade600],
        ),
      ],
    );
  }
}

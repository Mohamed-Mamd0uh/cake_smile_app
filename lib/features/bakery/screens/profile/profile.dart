import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.setting),
          ),
        ],
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Iconsax.user, size: 50),
            ),
            SizedBox(height: 16),
            Text('مرحباً بك في Cake & Smile'),
            SizedBox(height: 8),
            Text('سجل دخول للوصول إلى طلباتك وتفضيلاتك'),
          ],
        ),
      ),
    );
  }
}

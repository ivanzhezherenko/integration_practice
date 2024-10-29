import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: kToolbarHeight + 16),
        child: Column(
          children: [
            TextButton(
              onPressed: () => GoRouter.of(context).push('/contacts'),
              child: const Text('List Page'),
            ),
          ],
        ),
      ),
    );
  }
}

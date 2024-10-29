import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:integration_practice/pages/contacts_list/contacts_list.dart';
import 'package:integration_practice/pages/home_page/home_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        initialLocation: '/',
        routes: [
          GoRoute(
            name: 'Home',
            path: '/',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            name: 'contacts list',
            path: '/contacts',
            builder: (context, state) => const ContactsList(),
          ),
        ],
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
    );
  }
}

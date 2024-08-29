import 'package:classroom_flutter/features/authentication/presentation/providers/auth_provider.dart';
import 'package:classroom_flutter/features/classroom/presentation/screen/HomePage.dart';
import 'package:classroom_flutter/features/authentication/presentation/screens/LoginPage.dart';
import 'package:classroom_flutter/features/classroom/presentation/screen/JoinClassPage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a provider for GoRouter
final goRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider); // Example auth provider

  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
        redirect: (context, state) {
          return authState.isAuthenticated ? null : '/';
        },
      ),
      GoRoute(
        path: '/join',
        name: 'join',
        builder: (context, state) => const JoinClassPage(),
      ),
    ],
    errorBuilder: (context, state) => const ErrorScreen(),
    redirect: (context, state) {
      // Handle any global redirects here, like forcing login if not authenticated
      final isAuthenticated = ref.read(authProvider).isAuthenticated;
      final isLoggingIn = state.matchedLocation == '/';

      if (!isAuthenticated && !isLoggingIn) return '/';
      if (isAuthenticated && isLoggingIn) return '/home';

      return null;
    },
  );
});

// Error screen example
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('An error occurred!'),
      ),
    );
  }
}

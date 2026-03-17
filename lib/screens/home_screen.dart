import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthService authService;

  const HomeScreen({super.key, required this.authService});

  @override
  Widget build(BuildContext context) {
    final user = authService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () {
              authService.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) => LoginScreen(authService: authService),
                ),
              );
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
      body: Center(
        child: Text(
          user == null ? 'Not signed in' : 'Signed in as ${user.email}',
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
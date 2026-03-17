import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';


class HomeScreen extends StatefulWidget {
  final AuthService authService;

  const HomeScreen({super.key, required this.authService});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _enjoyed = false; 

  @override
  Widget build(BuildContext context) {
    final user = widget.authService.currentUser; 

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          TextButton(
            onPressed: () {
              widget.authService.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (_) =>
                      LoginScreen(authService: widget.authService),
                ),
              );
            },
            child: const Text('Sign out'),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              user == null ? 'Not signed in' : 'Signed in as ${user.email}',
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  value: _enjoyed,
                  onChanged: (value) {
                    setState(() {
                      _enjoyed = value ?? false;
                    });
                  },
                ),
                const Text('I enjoyed this demo'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
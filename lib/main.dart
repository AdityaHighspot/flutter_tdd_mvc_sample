// coverage:ignore-file
import 'package:flutter/material.dart';
import 'package:flutter_random_list/app/auth/login_view.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Blog Posts')),
      body: const LoginView(),
    );
  }
}

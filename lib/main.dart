import 'package:flutter/material.dart';
import 'package:ecolreaf_mobile/auth/login_page.dart'; // Perbaikan path

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecolreaf Mobile',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(), // Pastikan ini sudah ada
    );
  }
}

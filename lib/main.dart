import 'package:flutter/material.dart';
import 'package:gallery_application/screens/log_in.dart';
import 'package:provider/provider.dart';
import 'package:gallery_application/providers/auth_provider.dart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MaterialApp(
        title: 'Products basket',
        home: LogInScreen(),
      ),
    );
  }
}

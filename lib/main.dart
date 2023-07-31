import 'package:flutter/material.dart';

import 'package:gallery_application/myApp.dart';
import 'package:gallery_application/providers/auth_provider.dart.dart';
import 'package:gallery_application/providers/basket_provider.dart';
import 'package:gallery_application/providers/product_provider.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MainApp(
      child: MyApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  final Widget child;

  const MainApp({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => AuthProvider()),
      ChangeNotifierProvider(create: (context) => ProductProvider()),
      ChangeNotifierProvider(create: (context) => BasketProvider()),
      ChangeNotifierProvider(create: (context) => SettingsProvider()),
    ], child: child);
  }
}

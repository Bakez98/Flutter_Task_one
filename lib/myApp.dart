import 'package:flutter/material.dart';
import 'package:gallery_application/models/theme.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:gallery_application/screens/log_in.dart';
import 'package:gallery_application/screens/tabs.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SettingsProvider>(context, listen: false)
          .setArabicLanguageSelected(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products basket',
      theme: Provider.of<SettingsProvider>(context).isDarkThemeEnabled
          ? dark
          : light,
      home: TabsScreen(),
    );
  }
}

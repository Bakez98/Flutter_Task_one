import 'package:flutter/material.dart';
import 'package:gallery_application/providers/auth_provider.dart.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:gallery_application/screens/settings.dart';
import 'package:provider/provider.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  // final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    var cont = context.watch<SettingsProvider>();
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    return Directionality(
      textDirection:
          cont.isArabicLanguageSelected ? TextDirection.rtl : TextDirection.ltr,
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.indigo
                    : Colors.teal[900],
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Text(
                    cont.language["settings"],
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 26,
                color: Colors.black,
              ),
              title: Text(
                cont.language["app_settings"],
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                      fontSize: 24,
                    ),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => SettingsScreen(),
                  ),
                );
              },
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Text("Your Name : ${authProvider.user!.name}"),
                    // SizedBox(
                    //   height: 16,
                    // ),
                    // Text("Your Email : ${authProvider.user!.email}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

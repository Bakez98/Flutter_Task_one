import 'package:flutter/material.dart';
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
    return Drawer(
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
                        color: Theme.of(context).brightness == Brightness.light
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
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var cont = context.watch<SettingsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Directionality(
            textDirection: cont.isArabicLanguageSelected
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Text(cont.language["settings"])),
      ),
      body: Consumer<SettingsProvider>(builder: (context, st, ch) {
        // final locale = Localizations.localeOf(context);

        return Directionality(
          textDirection: st.isArabicLanguageSelected
              ? TextDirection.rtl
              : TextDirection.ltr,
          child: ListView(
            children: [
              ListTile(
                title: Text(cont.language["applicationTheme"]),
                trailing: Switch(
                  value: st.isDarkThemeEnabled,
                  onChanged: (value) {
                    //  Provider.of<SettingsProvider>(context, listen: false)
                    st.setDarkThemeEnabled(value);
                  },
                ),
                subtitle: Text(st.isDarkThemeEnabled ? 'Dark' : 'Light'),
              ),
              ListTile(
                title: Text(cont.language["applicationlanguage"]),
                trailing: Switch(
                  value: st.isArabicLanguageSelected,
                  onChanged: (value) {
                    st.setArabicLanguageSelected(value);
                  },
                ),
                subtitle:
                    Text(st.isArabicLanguageSelected ? 'العربيه' : 'English'),
              ),
            ],
          ),
        );
      }),
    );
  }
}

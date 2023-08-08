// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:gallery_application/screens/registration.dart';
import 'package:gallery_application/providers/auth_provider.dart.dart';
import 'package:gallery_application/screens/tabs.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

// @override
//   State<LogInScreen> createState() {
//     return _LogInScreenState();
//   }

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailAddressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      final myProvider = Provider.of<AuthProvider>(context, listen: false);
      if (myProvider.loginUser(
          _emailAddressController.text, _passwordController.text)) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => const TabsScreen(),
          ),
        );
      } else if (myProvider.passwordNotCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            width: 200,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            content: const Text("Entered Password is Wrong !"),
          ),
        );
      } else if (myProvider.userNotCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            width: 200,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            content: const Text("Entered UserName Is Wrong"),
          ),
        );
      } else if (myProvider.userNotCorrect && myProvider.passwordNotCorrect) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            width: 200,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            behavior: SnackBarBehavior.floating,
            content: const Text("Entered UserName and Password Is Wrong"),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var cont = context.watch<SettingsProvider>();

    return Directionality(
      textDirection:
          cont.isArabicLanguageSelected ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            title: Text(cont.language["login"].toString()),
          ),
          body: Consumer<SettingsProvider>(
            builder: (context, st, ch) {
              return Directionality(
                textDirection: st.isArabicLanguageSelected
                    ? TextDirection.rtl
                    : TextDirection.ltr,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cont.language["login_to_your_account"].toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _emailAddressController,
                          decoration: InputDecoration(
                            label: Text(cont.language["eml"].toString()),
                            prefixIcon: const Icon(Icons.email_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email Address is Required!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            label: Text(cont.language["password"].toString()),
                            prefixIcon: const Icon(Icons.password_outlined),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password is Required!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: _login,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(cont.language["login"].toString()),
                              Icon(Icons.login_outlined),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(cont.language["dont_have_account"].toString()),
                            const SizedBox(
                              width: 5,
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const RegistrationScreen(),
                                ),
                              ),
                              child: Text(cont.language["sign_up"].toString()),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}

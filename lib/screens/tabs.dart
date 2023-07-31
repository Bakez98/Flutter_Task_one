import 'package:flutter/material.dart';
import 'package:gallery_application/main.dart';
import 'package:gallery_application/providers/auth_provider.dart.dart';
import 'package:gallery_application/providers/settings_provider.dart';
import 'package:gallery_application/screens/add_products.dart';
import 'package:gallery_application/screens/log_in.dart';
import 'package:gallery_application/screens/products_basket.dart';
import 'package:gallery_application/screens/products_list.dart';
import 'package:gallery_application/widgets/drawer.dart';
import 'package:provider/provider.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _logOut() {
    final myProvider = Provider.of<AuthProvider>(context, listen: false);
    myProvider.logoutUser();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const LogInScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var cont = context.watch<SettingsProvider>();
    Widget activePage = const ProductsScreen();
    var activePageTitle = cont.language["our_products"];

    if (_selectedPageIndex == 1) {
      activePage = const ProductsBasket();
      activePageTitle = "Your Basket";
    }

    return Scaffold(
      drawer: const MainDrawer(
          // onSelectScreen: _setScreen,
          ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProducts()));
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: _logOut,
            icon: const Icon(Icons.logout_sharp),
          ),
        ],
        title: Text(activePageTitle),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: _setScreen,
      // ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            label: cont.language["products"],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_basket,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            label: cont.language["basket"],
          ),
        ],
      ),
    );
  }
}

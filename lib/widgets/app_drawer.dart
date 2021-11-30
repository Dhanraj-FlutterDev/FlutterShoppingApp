import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/screens/order_screen.dart';
import 'package:flutter_shopping_app/screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                color: Colors.amber,
                child: const Center(child: Text('Happy Shopping')),
              )),
          ListTile(
            title: const Text('Home'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            title: const Text('Orders'),
            leading: const Icon(Icons.home),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrderScreen.OrderScreenRouteName);
            },
          ),
          ListTile(
            title: const Text('Magage Orders'),
            leading: const Icon(Icons.shopping_bag),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(
                  UserProductsScreen.UserPrdtScreenRouteName);
            },
          )
        ],
      ),
    );
  }
}

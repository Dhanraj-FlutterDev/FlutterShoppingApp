import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/product.dart';
import 'package:flutter_shopping_app/providers/product_provider.dart';
import 'package:flutter_shopping_app/screens/editoradd_product_screen.dart';
import 'package:flutter_shopping_app/widgets/app_drawer.dart';
import 'package:flutter_shopping_app/widgets/products_view.dart';
import 'package:provider/provider.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  static const UserPrdtScreenRouteName = '/user-products';

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                    EditOrAddProductScreen.EditAddScreenRouteName,
                    arguments: false);
              },
              child: const Text(
                'Add New',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          itemBuilder: (context, index) {
            return ProductsView(
              id: products.items[index].id,
              price: products.items[index].price,
              desc: products.items[index].description,
              title: products.items[index].title,
              image: products.items[index].imageUrl,
            );
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: products.items.length),
    );
  }
}

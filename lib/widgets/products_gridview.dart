import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/product.dart';
import 'package:flutter_shopping_app/providers/product_provider.dart';
import 'package:flutter_shopping_app/widgets/product_itemview.dart';
import 'package:provider/provider.dart';

class ProductGridView extends StatelessWidget {
  final bool showFavourite;

  ProductGridView({
    required this.showFavourite,
  });

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final myProducts =
        showFavourite ? productsData.favItems : productsData.items;

    return GridView.builder(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        itemCount: myProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 2),
        itemBuilder: (context, index) {
          return ChangeNotifierProvider.value(
            value: myProducts[index],
            child: ProductItemView(),
          );
        });
  }
}

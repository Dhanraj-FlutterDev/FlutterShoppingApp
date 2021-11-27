import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/product.dart';
import 'package:flutter_shopping_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItemView extends StatelessWidget {
  // final String id;
  // final String title;
  // final String image;

  // const ProductItemView({
  //   Key? key,
  //   required this.id,
  //   required this.title,
  //   required this.image,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
                context, ProductDetailScreen.ProductDetailScreenRoute,
                arguments: product.id);
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          title: Text(product.title),
          leading: Consumer<Product>(
            builder: (c, product, _) {
              return IconButton(
                  color: Theme.of(context).primaryColorLight,
                  onPressed: () {
                    product.toggleFavourite();
                  },
                  icon: product.isFavourite
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border));
            },
          ),
          trailing: IconButton(
              color: Theme.of(context).primaryColorLight,
              onPressed: () {},
              icon: Icon(Icons.shopping_cart)),
        ),
      ),
    );
  }
}

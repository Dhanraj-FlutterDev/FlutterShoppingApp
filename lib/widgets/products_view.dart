import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/product_provider.dart';
import 'package:flutter_shopping_app/screens/editoradd_product_screen.dart';
import 'package:provider/provider.dart';

class ProductsView extends StatelessWidget {
  const ProductsView(
      {Key? key,
      required this.title,
      required this.image,
      required this.desc,
      required this.id,
      required this.price})
      : super(key: key);

  final String id;
  final String title;
  final double price;
  final String desc;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title.toString()),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    EditOrAddProductScreen.EditAddScreenRouteName,
                    arguments: EditAddArguments(isEdit: true, productId: id),
                  );
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  Provider.of<ProductProvider>(context, listen: false)
                      .deleteProduct(id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                )),
          ],
        ),
      ),
    );
  }
}

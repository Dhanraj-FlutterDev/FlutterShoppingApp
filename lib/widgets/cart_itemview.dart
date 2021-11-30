import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart.dart';
import 'package:provider/provider.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({
    Key? key,
    required this.price,
    required this.title,
    required this.id,
    required this.productId,
    required this.quantity,
  }) : super(key: key);

  final double price;
  final String title;
  final String id;
  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: ValueKey(id),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text(title.toString()),
                content: const Text('Are you sure you want to remove?'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: const Text('NO')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: const Text('YES'))
                ],
              );
            });
      },
      onDismissed: (dismiss) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: ListTile(
          leading: CircleAvatar(
            child: FittedBox(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text('\$$price'),
              ),
            ),
          ),
          title: Text(title.toString()),
          subtitle: Text('totle: ${(price * quantity)}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}

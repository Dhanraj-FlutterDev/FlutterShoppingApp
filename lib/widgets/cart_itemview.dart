import 'package:flutter/material.dart';

class CartItemView extends StatelessWidget {
  const CartItemView({
    Key? key,
    required this.price,
    required this.title,
    required this.id,
    required this.quantity,
  }) : super(key: key);

  final double price;
  final String title;
  final String id;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}

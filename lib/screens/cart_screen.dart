import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/cart.dart';
import 'package:flutter_shopping_app/widgets/cart_itemview.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const CartScreenRoute = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            elevation: 5,
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Total'),
                ),
                const Spacer(),
                Chip(
                    backgroundColor: Theme.of(context).primaryColorLight,
                    label: Text(
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    )),
                TextButton(
                    onPressed: () {}, child: Text('order now'.toUpperCase()))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          cart.items.length > 0
              ? Expanded(
                  child: ListView.builder(
                      itemCount: cart.items.length,
                      itemBuilder: (context, index) {
                        return CartItemView(
                          price: cart.items.values.toList()[index].price,
                          title: cart.items.values.toList()[index].title,
                          id: cart.items.values.toList()[index].id,
                          quantity: cart.items.values.toList()[index].quantity,
                        );
                      }))
              : const Text('No items added')
        ],
      ),
    );
  }
}

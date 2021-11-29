import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/orders.dart';
import 'package:intl/intl.dart';

class OrderItemView extends StatelessWidget {
  OrderItemView({Key? key, required this.orderItem}) : super(key: key);

  OrderItem orderItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: ListTile(
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Number of Item ${orderItem.products.length}'),
            Flexible(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ...orderItem.products.map((e) {
                    return Row(
                      children: [
                        Text('${e.title}'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text('x${e.quantity}'),
                      ],
                    );
                  }),
                ],
              ),
            )
          ],
        ),
        subtitle: Text(DateFormat('dd/mm/yyyy').format(orderItem.dateTime)),
        trailing: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Total'),
            Text(orderItem.amount.toString()),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/product_provider.dart';
import 'package:flutter_shopping_app/screens/product_detail_screen.dart';
import 'package:flutter_shopping_app/screens/product_overview_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.blue.shade700,
            primaryColorDark: Colors.blue.shade900,
            primaryColorLight: Colors.blueAccent.shade200),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetailScreen.ProductDetailScreenRoute: (context) =>
              const ProductDetailScreen(),
        },
      ),
    );
  }
}

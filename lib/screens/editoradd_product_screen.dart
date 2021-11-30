import 'package:flutter/material.dart';
import 'package:flutter_shopping_app/providers/product.dart';
import 'package:flutter_shopping_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

class EditOrAddProductScreen extends StatefulWidget {
  const EditOrAddProductScreen({
    Key? key,
  }) : super(key: key);
  static const EditAddScreenRouteName = 'edit-add-screen';

  @override
  State<EditOrAddProductScreen> createState() => _EditOrAddProductScreenState();
}

class _EditOrAddProductScreenState extends State<EditOrAddProductScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  FocusNode titlefn = FocusNode();
  FocusNode pricefn = FocusNode();
  FocusNode desfn = FocusNode();
  FocusNode imagefn = FocusNode();

  setImage() {
    setState(() {
      imageController.text;
    });
  }

  Product newProduct =
      Product(id: '', title: '', description: '', price: 0, imageUrl: '');

  void _addProduct() {
    newProduct = Product(
        id: DateTime.now().toString(),
        title: titleController.text,
        description: descriptionController.text,
        price: double.parse(priceController.text),
        imageUrl: imageController.text);

    Provider.of<ProductProvider>(context, listen: false).addProduct(newProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bool isEdit = ModalRoute.of(context)!.settings.arguments as bool;

    return Scaffold(
      appBar: AppBar(
        title: isEdit ? const Text('Edit Product') : const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
            child: ListView(
          children: [
            TextFormField(
              controller: titleController,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              focusNode: titlefn,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(pricefn);
              },
              decoration: const InputDecoration(
                label: Text('Title'),
              ),
            ),
            TextFormField(
              controller: priceController,
              focusNode: pricefn,
              keyboardType: TextInputType.number,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(desfn);
              },
              decoration: const InputDecoration(
                label: Text('Price'),
              ),
            ),
            TextFormField(
              controller: descriptionController,
              focusNode: desfn,
              keyboardType: TextInputType.multiline,
              onFieldSubmitted: (_) {},
              maxLines: 3,
              decoration: const InputDecoration(
                label: Text('Description'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  height: 120,
                  width: 120,
                  child: imageController.text.isEmpty
                      ? const Center(
                          child: Text('Enter url'),
                        )
                      : Image.network(
                          imageController.text,
                          fit: BoxFit.cover,
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: imageController,
                          focusNode: imagefn,
                          keyboardType: TextInputType.url,
                          onFieldSubmitted: (_) {},
                          decoration: const InputDecoration(
                            label: Text('Enter Image url'),
                          ),
                        ),
                      ),
                      TextButton(
                          onPressed: setImage, child: const Text('Preview'))
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  if (!isEdit) {
                    _addProduct();
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('added')));
                    titleController.clear();
                    priceController.clear();
                    descriptionController.clear();
                    imageController.clear();
                  }
                  print('edit pressed');
                },
                child: isEdit
                    ? const Text('Edit Product')
                    : const Text('Add Product'))
          ],
        )),
      ),
    );
  }
}

import 'package:ecommerce_app_review/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class NewProductListScreen extends StatefulWidget {
  const NewProductListScreen({super.key});

  static const String name = '/new-product-list-screen';

  @override
  State<NewProductListScreen> createState() =>
      _NewProductListScreenState();
}

class _NewProductListScreenState extends State<NewProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Product List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.8,
            crossAxisSpacing: 2,
            mainAxisSpacing: 4,
          ),
          itemBuilder: (context, index) {
            return FittedBox(
              child: ProductItemWidget(),
            );
          },
        ),
      ),
    );
  }
}

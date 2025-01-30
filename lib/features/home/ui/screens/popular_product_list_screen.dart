import 'package:ecommerce_app_review/features/common/ui/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

class PopularProductListScreen extends StatefulWidget {
  const PopularProductListScreen({super.key});

  static const String name = '/popular-product-list-screen';

  @override
  State<PopularProductListScreen> createState() =>
      _PopularProductListScreenState();
}

class _PopularProductListScreenState extends State<PopularProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Product List'),
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

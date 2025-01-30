import 'package:ecommerce_app_review/features/product/ui/screens/create_review_screen.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatefulWidget {
  const ProductReviewsScreen({super.key});

  static const String name = '/product/product-details/product-reviews';

  @override
  State<ProductReviewsScreen> createState() => _ProductReviewsScreenState();
}

class _ProductReviewsScreenState extends State<ProductReviewsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Reviews'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8, right: 8),
                child: Column(
                  children: _getReviewList(),
                ),
              ),
            ),
          ),
          _buildReviewsQuantityAndAddButtonSection(textTheme),
        ],
      ),
    );
  }

  List<Widget> _getReviewList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            color: Colors.white,
            elevation: 0.5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildUserReview(),
            ),
          ),
        ),
      );
    }
    return categoryList;
  }

  Widget _buildUserReview() {
    return Column(
      spacing: 8,
      children: [
        Row(
          spacing: 8,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade200,
              child: Icon(
                Icons.person_outline,
                size: 24,
                color: Colors.grey,
              ),
            ),
            Text(
              'Arifuzzaman Shakil',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
          ],
        ),
        Text(
          "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.",
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget _buildReviewsQuantityAndAddButtonSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Reviews', style: textTheme.titleMedium),
              Text('(1000)', style: textTheme.titleMedium),
            ],
          ),
          SizedBox(
            width: 60,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
              ),
              onPressed: () {
                Navigator.pushNamed(context, CreateReviewScreen.name);
              },
              child: Icon(
                Icons.add,
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

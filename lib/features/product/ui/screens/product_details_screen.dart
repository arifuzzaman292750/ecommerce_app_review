import 'package:demo_package/demo_package.dart';
import 'package:ecommerce_app_review/app/app_colors.dart';
import 'package:ecommerce_app_review/features/product/ui/screens/product_reviews_screen.dart';
import 'package:ecommerce_app_review/features/product/ui/widgets/color_picker_widget.dart';
import 'package:ecommerce_app_review/features/product/ui/widgets/product_image_carousel_slider.dart';

import 'package:ecommerce_app_review/features/product/ui/widgets/size_picker_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;

  static const String name = '/product/product-details';

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageCarouselSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Text(
                                'Nike Shoe AR22EE - New year special deal',
                                style: textTheme.titleMedium,
                              ),
                            ),
                            QuantityIncDecButton(
                              color: AppColors.themeColor,
                              onChange: (int value) {},
                            ),
                          ],
                        ),
                        _buildRatingReviewsWishSection(),
                        SizedBox(height: 16),
                        _buildColorSizePickerAndDescriptionSection(textTheme),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection(textTheme),
        ],
      ),
    );
  }

  Widget _buildRatingReviewsWishSection() {
    return Row(
      spacing: 4,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Colors.amber,
              size: 18,
            ),
            Text(
              '4.8',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, ProductReviewsScreen.name);
          },
          child: Text('Reviews'),
        ),
        Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.themeColor,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Icon(
            Icons.favorite_border,
            size: 14,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildColorSizePickerAndDescriptionSection(TextTheme textTheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Color', style: textTheme.titleMedium),
        SizedBox(height: 8),
        ColorPickerWidget(
          colors: ['Red', 'Blue', 'Green', 'Yellow', 'Orange'],
          onColorSelected: (String selectedColor) {},
        ),
        SizedBox(height: 16),
        Text('Size', style: textTheme.titleMedium),
        SizedBox(height: 8),
        SizePickerWidget(
          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
          onSizeSelected: (String selectedSize) {},
        ),
        SizedBox(height: 16),
        Text('Description', style: textTheme.titleMedium),
        SizedBox(height: 8),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceAndAddToCartSection(TextTheme textTheme) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Price', style: textTheme.titleSmall),
              Text(
                '\$100',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.themeColor,
                ),
              ),
            ],
          ),
          SizedBox(
            width: 120,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Add To Cart'),
            ),
          ),
        ],
      ),
    );
  }
}

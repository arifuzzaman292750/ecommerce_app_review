import 'package:ecommerce_app_review/app/app_colors.dart';
import 'package:ecommerce_app_review/features/product/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductListScreen.name,
          arguments: 'Computer',
        );
      },
      child: Column(
        spacing: 4,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.computer,
              color: AppColors.themeColor,
              size: 42,
            ),
          ),
          Text(
            'Computer',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}

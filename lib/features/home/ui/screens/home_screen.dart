import 'package:ecommerce_app_review/app/assets_path.dart';
import 'package:ecommerce_app_review/features/common/controllers/main_bottom_nav_controller.dart';
import 'package:ecommerce_app_review/features/common/ui/widgets/home_section_header.dart';
import 'package:ecommerce_app_review/features/home/ui/screens/new_product_list_screen.dart';
import 'package:ecommerce_app_review/features/home/ui/screens/popular_product_list_screen.dart';
import 'package:ecommerce_app_review/features/home/ui/screens/special_product_list_screen.dart';
import 'package:ecommerce_app_review/features/home/ui/widgets/app_bar_icon_button.dart';
import 'package:ecommerce_app_review/features/common/ui/widgets/category_item_widget.dart';
import 'package:ecommerce_app_review/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:ecommerce_app_review/features/common/ui/widgets/product_item_widget.dart';
import 'package:ecommerce_app_review/features/home/ui/widgets/product_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String name = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _homeSearchBarTEController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              ProductSearchBar(
                controller: _homeSearchBarTEController,
              ),
              HomeCarouselSlider(),
              HomeSectionHeader(
                title: 'All Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getCategoryList(),
                ),
              ),
              HomeSectionHeader(
                title: 'Popular',
                onTap: () {
                  Navigator.pushNamed(context, PopularProductListScreen.name);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              HomeSectionHeader(
                title: 'Special',
                onTap: () {
                  Navigator.pushNamed(context, SpecialProductListScreen.name);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
              HomeSectionHeader(
                title: 'New',
                onTap: () {
                  Navigator.pushNamed(context, NewProductListScreen.name);
                },
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _getProductList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getCategoryList() {
    List<Widget> categoryList = [];
    for (int i = 0; i < 10; i++) {
      categoryList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CategoryItemWidget(),
        ),
      );
    }
    return categoryList;
  }

  List<Widget> _getProductList() {
    List<Widget> productList = [];
    for (int i = 0; i < 10; i++) {
      productList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ProductItemWidget(),
        ),
      );
    }
    return productList;
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.navAppLogoSvg),
      actions: [
        AppBarIconButton(
          icon: Icons.person_outline,
          onTap: () {},
        ),
        SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.call,
          onTap: () {},
        ),
        SizedBox(width: 6),
        AppBarIconButton(
          icon: Icons.notifications_active_outlined,
          onTap: () {},
        ),
        SizedBox(width: 16),
      ],
    );
  }
}

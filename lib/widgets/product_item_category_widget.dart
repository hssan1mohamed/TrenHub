import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/categories_service.dart';
import '../services/get_all_product_service.dart';
import 'cart_product_widget.dart';

class ProductItemCat extends StatelessWidget {
  const ProductItemCat({
    super.key, required this.categoryName,

  });
final String categoryName;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
        future: CategoriesService().getCategoriesProducts(categoryName: categoryName),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          }
          List<ProductModel> product = snapshot.data!;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // Return a widget for each item in the grid
                return GridTile(child: CartProduct(product: product[index]));
              },
              childCount: product.length, // Specify the number of items in the grid
            ),
          );
        });
  }
}

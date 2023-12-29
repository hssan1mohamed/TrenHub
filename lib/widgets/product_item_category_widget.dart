import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_test/cubits/get_data_cate/get_data_cate_cubit.dart';
import 'package:store_test/widgets/showSnackBar.dart';
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
    List<ProductModel>? products=[];
    BlocProvider.of<GetDataCateCubit>(context).getDataCate(categoryName: categoryName);
    return  BlocBuilder<GetDataCateCubit, GetDataCateState>(
  builder: (context, state) {
    if (state is GetDataCateDone) {
      products = state.products;
    } else if (state is GetDataCateLoading) {
      return const SliverToBoxAdapter(
          child: Center(
            child: CircularProgressIndicator(),
          ));
    }else if(state is GetDataCateError){
      showSnackBar(context,state.error);
    }

    return products == []
        ? const SliverToBoxAdapter(
      child: Center(child: CircularProgressIndicator()),
    )
        : SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of columns in the grid
              crossAxisSpacing: 10, // Spacing between columns
              mainAxisSpacing: 10, // Spacing between rows
            ),
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                // Return a widget for each item in the grid
                return GridTile(child: CartProduct(product: products![index]));
              },
              childCount: products!.length, // Specify the number of items in the grid
            ),
          );
  },
);

  }
}

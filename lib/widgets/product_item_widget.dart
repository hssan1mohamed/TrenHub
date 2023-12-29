import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_test/cubits/get_body_data/get_body_data_cubit.dart';
import 'package:store_test/models/product_model.dart';
import 'package:store_test/widgets/showSnackBar.dart';
import 'cart_product_widget.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<ProductModel>? product = [];
    BlocProvider.of<GetBodyDataCubit>(context).getBodyData();
    return BlocBuilder<GetBodyDataCubit, GetBodyDataState>(
      builder: (context, state) {
        if (state is GetBodyDataDone) {
          product = state.products;
        } else if (state is GetBodyDataLoading) {
          return const SliverToBoxAdapter(
              child: Center(
            child: CircularProgressIndicator(),
          ));
        }else if(state is GetBodyDataError){
           showSnackBar(context,state.error);
        }

        return product == []
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
                    return GridTile(
                        child: CartProduct(product: product![index]));
                  },
                  childCount: product!
                      .length, // Specify the number of items in the grid
                ),
              );
      },
    );
  }
}

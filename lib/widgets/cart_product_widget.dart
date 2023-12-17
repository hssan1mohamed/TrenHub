import 'package:flutter/material.dart';

import '../Screens/product_details.dart';
import '../helper/lists.dart';
import '../models/product_model.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key, required this.product});
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ProductDetails(productModel: product,))),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: getRandomColor(), // Set your desired border color here
              width: 2.0, // Set the width of the border
            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  product!.image,
                  height: 100,
                  width: 100,
                ),
                Text(
                  product!.title.substring(0, 6),
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      r'$' '${product!.price.toString()}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ])),
    );
  }
}

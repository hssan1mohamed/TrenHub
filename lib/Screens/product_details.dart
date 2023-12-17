import 'package:flutter/material.dart';
import 'package:store_test/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({super.key, required this.productModel});
  ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: Colors.blueAccent),
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         const Text('Details',maxLines: 14,overflow: TextOverflow.ellipsis,softWrap: true,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white)),
                         Expanded(child: Text(productModel!.description,style:const TextStyle(fontSize: 18,),)),
                         const Text('Price',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white)),
                         Text('\$${productModel!.price.toString()}',style:const TextStyle(fontSize: 22,color: Colors.yellow,)),
                         const Text('Category',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white)),
                         Text(productModel!.category,style:const TextStyle(fontSize: 20,))
                       ],
                    ),
                  ),
                ),
              )
            ],
          ),
          Positioned(
            top: 50,
            left: 20,
            child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 25,
                child: IconButton(
                    onPressed: ()=>Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new))),
          ),
          Positioned(
            right: 10,
            top: 100,
            child: Image.network(
              productModel!.image,
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            top: 130,
            left: 15,
            child: SizedBox(
              width: 150,
              child: Text(
                productModel!.title,
                maxLines: 5,
                softWrap: true,
                style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

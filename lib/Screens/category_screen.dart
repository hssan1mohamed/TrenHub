import 'package:flutter/material.dart';
import 'package:store_test/widgets/product_item_category_widget.dart';
class CategoryScreen extends StatelessWidget {
 final String? title;
  const CategoryScreen({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(onPressed: ()=>Navigator.pop(context), 
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.black,)),
        title:  Text(title!,
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomScrollView(
          slivers: [
            ProductItemCat(categoryName: title!)
          ],
        ),
      ) ,
    );
  }
}

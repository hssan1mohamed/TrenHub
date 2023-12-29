import 'package:flutter/material.dart';
import '../widgets/cate_widget.dart';
import '../widgets/header_widget.dart';
import '../widgets/product_item_widget.dart';
import 'add_product.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () =>Navigator.push(context,
                MaterialPageRoute(builder: (context)=>AddNewProduct())),
            icon: const Icon(Icons.add),
            color: Colors.black,
            iconSize: 25,
          )
        ],
        title: const Text('TrendHub',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      body:const Padding(
        padding: EdgeInsets.all(8.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HeadersWidget(title: 'Categories')),
            SliverToBoxAdapter(child: CateWidget()),
            SliverToBoxAdapter(child: HeadersWidget(title: 'All Products')),
            ProductItem()
          ],
        ),
      ),
    );
  }
}

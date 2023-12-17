import 'package:flutter/material.dart';
import 'package:store_test/Screens/category_screen.dart';

import '../helper/lists.dart';
import '../services/all_categories_service.dart';

class CateWidget extends StatelessWidget {
  const CateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: AllCategoriesService().getAllCateogires(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          List<dynamic> cate = snapshot.data!;
          return SizedBox(
            height: 80,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder:
                          (context)=>CategoryScreen(title:snapshot.data![i] ,))),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: Colors
                                  .white, // Set your desired border color here
                              width: 4.0, // Set the width of the border
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: getRandomColor(),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: const Offset(0, 1),),
                            ]),
                        child: Text(snapshot.data![i],
                            style: const TextStyle(fontSize: 20)),
                      ),
                    ),
                  );
                }),
          );
        });
  }
}

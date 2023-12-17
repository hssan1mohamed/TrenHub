import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:store_test/widgets/botton.dart';
import 'package:store_test/widgets/text_form.dart';

import '../services/add_product.dart';

class AddNewProduct extends StatelessWidget {
  AddNewProduct({super.key});
  var formKey = GlobalKey<FormState>();
  var title = TextEditingController();
  var price = TextEditingController();
  var desc = TextEditingController();
  var image = TextEditingController();
  var category = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: Text('Add New Peoduct',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                DefaultFieldForm(
                    controller: title,
                    keyboard: TextInputType.name,
                    hint: 'write your name of product',
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter any thing';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                DefaultFieldForm(
                    hint: 'price of product',
                    controller: price,
                    keyboard: TextInputType.number,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter any thing';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                DefaultFieldForm(
                    hint: 'details of product',
                    controller: desc,
                    keyboard: TextInputType.name,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter any thing';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                DefaultFieldForm(
                    hint: 'image url of product',
                    controller: image,
                    keyboard: TextInputType.name,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter any thing';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                DefaultFieldForm(
                    hint: 'category of product',
                    controller: category,
                    keyboard: TextInputType.name,
                    valid: (value) {
                      if (value.isEmpty) {
                        return 'Please Enter any thing';
                      }
                      return null;
                    }),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: ()async {
                      if (formKey.currentState!.validate()) {
                        await AddProduct().addProduct(
                            title: title.text,
                            price: price.text,
                            desc: desc.text,
                            image: image.text,
                            category: category.text);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Added product success')));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Colors.blueAccent,
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

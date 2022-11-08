import 'package:flutter/material.dart';
import 'myexpense_class.dart';
import 'main.dart';

class AddCategory extends StatefulWidget {
  @override
  State<AddCategory> createState() => AddCategoryState();
}

class AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();

  void addRemoveCat(bool add, String cat, [Icon myIcon = const Icon(Icons.clear)]){
    if(add){
      myUser.myCategories.add(Category(cat,myIcon));
    } else {

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add/Remove Category'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  width: 200,
                  height: 100,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Category',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a category';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Remove'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

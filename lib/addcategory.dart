import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';
import 'myexpense_class.dart';
import 'main.dart';
import 'dashboard.dart';
import 'listofexpenses.dart';
import 'addExpensePage.dart';

class AddCategory extends StatefulWidget {
  @override
  State<AddCategory> createState() => AddCategoryState();
}

class AddCategoryState extends State<AddCategory> {
  final _formKey = GlobalKey<FormState>();
  late Icon selectedIcon = const Icon(Icons.access_alarm);
  late String theCategory;


  void addRemoveCat(bool add, String cat,
      [Icon myIcon = const Icon(Icons.clear)]) {
    if (add) {
      myUser.myCategories.add(Category(cat, myIcon));
    } else {
      for (int i = 0; i < myUser.myCategories.length; i++) {
        if (myUser.myCategories[i].categoryName.toLowerCase() ==
            cat.toLowerCase()) {
          for(int j = 0; j < myUser.userExpenses.length; j++){
            if(myUser.userExpenses[j].theCategory.categoryName.toLowerCase() == cat.toLowerCase()){
              myUser.userExpenses.remove(myUser.userExpenses[j]);
            }
          }
          myUser.myCategories.remove(myUser.myCategories[i]);
          break;
        }
      }
    }
    _formKey.currentState!.reset();
  }

  void pickIcon() async {
    IconData? tempIcon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);

    selectedIcon = Icon(tempIcon);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Add/Remove Category'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => TheDashBoard(),
                    ),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Expenses'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => MyExpenseList(),
                    ),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Add New Category'),
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => AddCategory(),
                    ),
                    (route) => false,
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('User Settings'),
                onTap: () {},
              ),
            ],
          ),
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
                    onChanged: (value) => theCategory = value,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () => pickIcon(),
                  child: const Text('Choose Icon'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => addRemoveCat(false, theCategory),
                      child: const Text('Remove'),
                    ),
                  ),
                  Flexible(
                    child: ElevatedButton(
                      onPressed: () => addRemoveCat(true, theCategory,selectedIcon),
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

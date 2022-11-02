import 'package:flutter/material.dart';
import 'myexpense_class.dart';

CurrentUserExpenses myUser = CurrentUserExpenses();

void main() {
  myUser.myCategories.add(Category('Entertainment',const Icon(Icons.movie)));
  myUser.myCategories.add(Category('Food',const Icon(Icons.food_bank)));
  myUser.myCategories.add(Category('Necessities',const Icon(Icons.gas_meter_sharp)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: TheDashBoard(),
    );
  }
}

class TheDashBoard extends StatefulWidget{

  @override
  State<TheDashBoard> createState() => TheDashBoardState();
}

class TheDashBoardState extends State<TheDashBoard>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}


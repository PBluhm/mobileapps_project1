import 'package:flutter/material.dart';
import 'package:mobileapps_project1/dashboard.dart';
import 'listofexpenses.dart';
import 'myexpense_class.dart';
import 'addExpensePage.dart';
import 'package:intl/intl.dart';

CurrentUserExpenses myUser = CurrentUserExpenses();
DateTime currentTime = DateTime.now();
DateFormat myFormat = DateFormat.yMd();
String myCurrDate = myFormat.format(currentTime);

void main() {
  myUser.myCategories.add(Category('Entertainment',const Icon(Icons.movie)));
  myUser.myCategories.add(Category('Food',const Icon(Icons.food_bank)));
  myUser.myCategories.add(Category('Necessities',const Icon(Icons.gas_meter_sharp)));
  runApp(MyApp());
}

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      home: TheDashBoard(),
    );
  }
}




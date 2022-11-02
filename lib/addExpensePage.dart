import 'package:flutter/material.dart';
import 'myexpense_class.dart';

class AddExpense extends StatefulWidget{

  @override
  State<AddExpense> createState() => AddExpenseState();
}

class AddExpenseState extends State<AddExpense>{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
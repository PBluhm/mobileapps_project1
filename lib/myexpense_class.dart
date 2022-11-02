import 'package:flutter/material.dart';

class Category{
  String categoryName;
  Icon catIcon;

  Category(this.categoryName,this.catIcon);
}

class Expenses {
  Category theCategory;
  String typeOfExpense;
  DateTime dateOfExpense;
  double price;

  Expenses(this.theCategory,this.typeOfExpense,this.dateOfExpense,this.price);
}

class CurrentUserExpenses {
  List<Expenses> userExpenses = [];
  List<Category> myCategories = [];

  void addNewExpense(String category, String theExpense, String date, double price){
    late Category tempCat;
    for(int i = 0; i < myCategories.length; i++){
      if (category.toLowerCase() == myCategories[i].categoryName.toLowerCase()){
        tempCat = myCategories[i];
        break;
      }
    }

    DateTime changedDate = DateTime.parse(date).toUtc();

    userExpenses.add(Expenses(tempCat,theExpense,changedDate,price));

  }
}
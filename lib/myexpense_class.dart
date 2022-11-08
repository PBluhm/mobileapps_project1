import 'package:flutter/material.dart';
import 'package:mobileapps_project1/main.dart';

class Category {
  String categoryName;
  Icon catIcon;

  Category(this.categoryName, this.catIcon);
}

class Expenses {
  Category theCategory;
  String typeOfExpense;
  String dateOfExpense;
  double price;

  Expenses(
      this.theCategory, this.typeOfExpense, this.dateOfExpense, this.price);
}

class CurrentUserExpenses {
  List<Expenses> userExpenses = [];
  List<Category> myCategories = [];
  String usersCurrency = '\$';

  void addNewExpense(
      String category, String theExpense, String date, double price) {
    late Category tempCat;
    for (int i = 0; i < myCategories.length; i++) {
      if (category.toLowerCase() ==
          myCategories[i].categoryName.toLowerCase()) {
        tempCat = myCategories[i];
        break;
      }
    }
    userExpenses.add(Expenses(tempCat, theExpense, date, price));
  }

  List<Expenses> specifiedMonth(String date, bool day) {
    List<String> splitUserDate = date.split('/');
    List<Expenses> myTempList = [];
    if (!day) {
      for (int i = 0; i < userExpenses.length; i++) {
        List<String> tempSplit = userExpenses[i].dateOfExpense.split('/');
        if (tempSplit[0] == splitUserDate[0] &&
            tempSplit[2] == splitUserDate[2]) {
          myTempList.add(userExpenses[i]);
        }
      }
    } else {
      for (int i = 0; i < userExpenses.length; i++) {
        List<String> tempSplit = userExpenses[i].dateOfExpense.split('/');
        if (tempSplit[0] == splitUserDate[0] &&
            tempSplit[2] == splitUserDate[2] &&
            tempSplit[1] == splitUserDate[1]) {
          myTempList.add(userExpenses[i]);
        }
      }
    }
    return myTempList;
  }

  String startDateChange(DateTime date, int change, bool isForward){
    DateTime tempDate = date;
    if (!isForward){
      return myFormat.format(tempDate.subtract(Duration(days: change)));
    } else if (isForward){
      return myFormat.format(tempDate.add(Duration(days: change)));
    }
    return  '';
  }
}

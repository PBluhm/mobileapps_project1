import 'package:flutter/material.dart';
import 'main.dart';
import 'myexpense_class.dart';

class CustomerSearchDelegate extends SearchDelegate {

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context){
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for(Expenses expense in myUser.userExpenses){
      if(expense.price.toString().contains(query) && !(matchQuery.contains(expense.price.toString()))){
        matchQuery.add(expense.price.toString());
      } else if (expense.theCategory.categoryName.toLowerCase().contains(query.toLowerCase()) && !(matchQuery.contains(expense.theCategory.categoryName))){
        matchQuery.add(expense.theCategory.categoryName);
      } else if (expense.typeOfExpense.toLowerCase().contains(query.toLowerCase()) && !(matchQuery.contains(expense.typeOfExpense))){
        matchQuery.add(expense.typeOfExpense);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
          onTap: () {query = result;},
        );
      }
    );
  }

  @override
  Widget buildResults(BuildContext context){
    List<Expenses> matchQuery = [];
    for(Expenses expense in myUser.userExpenses){
      if(expense.theCategory.categoryName.toLowerCase() == query.toLowerCase()){
        matchQuery.add(expense);
      } else if (expense.price.toString() == query.toLowerCase()){
        matchQuery.add(expense);
      } else if (expense.typeOfExpense.toLowerCase() == query.toLowerCase()){
        matchQuery.add(expense);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: matchQuery[index].theCategory.catIcon,
          title: Text(matchQuery[index].typeOfExpense),
          trailing: Text('${matchQuery[index].price}'),
        );
      }
    );
  }

}
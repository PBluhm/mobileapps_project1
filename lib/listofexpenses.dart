import 'package:mobileapps_project1/usersearch.dart';
import 'main.dart';
import 'package:flutter/material.dart';
import 'addExpensePage.dart';
import 'myexpense_class.dart';
import 'dashboard.dart';

class MyExpenseList extends StatefulWidget {
  @override
  State<MyExpenseList> createState() => MyExpenseListState();
}

class MyExpenseListState extends State<MyExpenseList> {
  void myRefresh(value) async {
    setState(() {
      myUser.userExpenses;
      myUser.myCategories;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => AddExpense(),
                    ))
                    .then(myRefresh);
              },
              icon: const Icon(Icons.add),
            ),
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomerSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TheDashBoard(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.money),
                title: const Text('Expenses'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => MyExpenseList(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Add Expense'),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddExpense(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.category),
                title: const Text('Add New Category'),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('User Settings'),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Today'),
            ),
            Expanded(
              child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: myUser.specifiedMonth(myCurrDate, true).length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: myUser.specifiedMonth(myCurrDate, true)[index].theCategory.catIcon,
                          trailing: Text('${myUser.usersCurrency}${myUser.specifiedMonth(myCurrDate, true)[index].price}'),
                          title: Text(myUser.specifiedMonth(myCurrDate, true)[index].typeOfExpense),
                        );
                      })),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Yesterday'),
            ),
            Expanded(
              child: SizedBox(
                  height: 200,
                  child: ListView.builder(
                      itemCount: myUser.specifiedMonth(myUser.startDateChange(currentTime, 1, false), true).length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: myUser.specifiedMonth(myUser.startDateChange(currentTime, 1, false), true)[index].theCategory.catIcon,
                          trailing: Text('${myUser.usersCurrency}${myUser.specifiedMonth(myUser.startDateChange(currentTime, 1, false), true)[index].price}'),
                          title: Text(myUser.specifiedMonth(myUser.startDateChange(currentTime, 1, false), true)[index].typeOfExpense),
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}

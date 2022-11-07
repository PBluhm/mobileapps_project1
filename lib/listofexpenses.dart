import 'main.dart';
import 'package:flutter/material.dart';
import 'addExpensePage.dart';
import 'myexpense_class.dart';

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
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
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
                          trailing: Text('${myUser.specifiedMonth(myCurrDate, true)[index].price}'),
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
                          trailing: Text('${myUser.specifiedMonth(myUser.startDateChange(currentTime, 1, false), true)[index].price}'),
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

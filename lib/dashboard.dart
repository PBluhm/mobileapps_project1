import 'package:flutter/material.dart';
import 'main.dart';
import 'package:pie_chart/pie_chart.dart';
import 'addExpensePage.dart';
import 'myexpense_class.dart';
import 'listofexpenses.dart';
import 'addcategory.dart';

class TheDashBoard extends StatefulWidget {
  @override
  State<TheDashBoard> createState() => TheDashBoardState();
}

class TheDashBoardState extends State<TheDashBoard> {
  double totalSpentToday = 0;
  double totalSpentThisMonth = 0;

  Map<String, double> get myPieData {
    Map<String, double> tempMap = {};

    for (int i = 0; i < myUser.myCategories.length; i++) {
      tempMap[myUser.myCategories[i].categoryName] = 0;
    }

    for (int i = 0; i < myUser.userExpenses.length; i++) {
      tempMap[myUser.userExpenses[i].theCategory.categoryName] =
          tempMap[myUser.userExpenses[i].theCategory.categoryName]! +
              myUser.userExpenses[i].price;
    }
    return tempMap;
  }

  @override
  void initState() {
    super.initState();
    List<Expenses> tempListToday = myUser.specifiedMonth(myCurrDate, true);
    List<Expenses> tempListMonth = myUser.specifiedMonth(myCurrDate, false);
    for (int i = 0; i < tempListToday.length; i++) {
      totalSpentToday += tempListToday[i].price;
    }
    for (int i = 0; i < tempListMonth.length; i++) {
      totalSpentThisMonth += tempListMonth[i].price;
    }
  }

  void myRefresh(value) async {
    setState(() {
      totalSpentToday = 0;
      totalSpentThisMonth = 0;
      List<Expenses> tempListToday = myUser.specifiedMonth(myCurrDate, true);
      List<Expenses> tempListMonth = myUser.specifiedMonth(myCurrDate, false);
      for (int i = 0; i < tempListToday.length; i++) {
        totalSpentToday += tempListToday[i].price;
      }
      for (int i = 0; i < tempListMonth.length; i++) {
        totalSpentThisMonth += tempListMonth[i].price;
      }
      myPieData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                      builder: (context) => AddExpense(),
                    ))
                    .then(myRefresh);
              },
              icon: const Icon(Icons.add)),
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
              leading: const Icon(Icons.category),
              title: const Text('Add New Category'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddCategory(),
                  ),
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
      body: Column(
        children: [
          const Padding(
              padding: EdgeInsets.all(10),
              child: Center(child: Text('Expense BreakDown'))),
          Flexible(
            child: Center(
              child: SizedBox(
                height: 300,
                width: 350,
                child: PieChart(
                  dataMap: myPieData,
                  chartValuesOptions: const ChartValuesOptions(
                    showChartValuesInPercentage: true,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  'Total Spent Today: ${myUser.usersCurrency}$totalSpentToday'),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                  'Total Spent This Month: ${myUser.usersCurrency}$totalSpentThisMonth'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10),
            child: Center(
              child: Text('Added Expenses For Today'),
            ),
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: myUser.specifiedMonth(myCurrDate, true).length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: myUser
                            .specifiedMonth(myCurrDate, true)[index]
                            .theCategory
                            .catIcon,
                        trailing: Text(
                            '${myUser.usersCurrency}${myUser.specifiedMonth(myCurrDate, true)[index].price}'),
                        title: Text(myUser
                            .specifiedMonth(myCurrDate, true)[index]
                            .typeOfExpense),
                      );
                    })),
          ),
        ],
      ),
    );
  }
}

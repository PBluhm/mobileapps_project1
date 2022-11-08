import 'package:flutter/material.dart';
import 'myexpense_class.dart';
import 'main.dart';
import 'package:intl/intl.dart';

class AddExpense extends StatefulWidget {
  @override
  State<AddExpense> createState() => AddExpenseState();
}

class AddExpenseState extends State<AddExpense> {
  final _formKey = GlobalKey<FormState>();

  List<DropdownMenuItem<String>> get userDropDownItems {
    List<DropdownMenuItem<String>> myTempList = [];
    for (int i = 0; i < myUser.myCategories.length; i++) {
      myTempList.add(DropdownMenuItem(
          value: myUser.myCategories[i].categoryName,
          child: Text(myUser.myCategories[i].categoryName)));
    }
    return myTempList;
  }

  late String userSelectedCategory = userDropDownItems[0].value!;
  late String userSelectedDate;
  late String userSelectedExpense;
  late double userSelectedAmount;

  @override
  void initState() {
    super.initState();
    setState(() {
      userSelectedDate = myFormat.format(currentTime);
    });
  }

  void saveUserValue() {
    setState(() {
      if (_formKey.currentState!.validate()){
        myUser.addNewExpense(userSelectedCategory, userSelectedExpense, userSelectedDate, userSelectedAmount);
        _formKey.currentState!.reset();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saving Expense'))
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text('Add New Expense'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {Navigator.pop(context);},
            ),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 110,
                        height: 100,
                        child: TextFormField(
                          initialValue: userSelectedDate,
                          decoration: const InputDecoration(
                            hintText: 'Date',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value';
                            }
                            return null;
                          },
                          onChanged: (value) => userSelectedDate = value,
                        ),
                      ),
                      SizedBox(
                        width: 200,
                        height: 100,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Amount',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid value';
                            }
                            return null;
                          },
                          onChanged: (value) => userSelectedAmount = double.parse(value),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: SizedBox(
                  height: 100,
                  width: 200,
                  child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      value: userSelectedCategory,
                      items: userDropDownItems,
                      onChanged: (String? newValue) {
                        setState(() {
                          userSelectedCategory = newValue!;
                        });
                      }),
                ),
              ),
              SizedBox(
                width: 200,
                height: 100,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Expense',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid value';
                    }
                    return null;
                  },
                  onChanged: (value) => userSelectedExpense = value,
                ),
              ),
              ElevatedButton(
                  onPressed: () => saveUserValue(),
                  child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

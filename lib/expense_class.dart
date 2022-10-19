class Expense {

  List<String> myCurrExpense = [];
  Map<DateTime, List<String>> pastExpenses = {};
  Map<String, List<String>> myExpenses = {
    'Entertainment': [],
    'Food': [],
    'Gas': [],
    'Travel': [],
  };

  void newDay() {
    DateTime myNow = DateTime.now();
    DateTime myDate = DateTime(myNow.year,myNow.month,myNow.day);

    pastExpenses[myDate] = myCurrExpense;
  }




}
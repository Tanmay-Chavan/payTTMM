class Group {
  // field
  String engine = "E1001";

  // function
  void disp() {
    print(engine);
  }
}

class Participant {
  String id;
  double totalExpense = 0;
}

class Item {
  double amount = 0;
  double quantity = 1;
  String name = "item";
  var buyers = [];
}

class Bill {
  var items = [];
}

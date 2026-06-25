class TransactionModel {
  String category;
  double amount;
  String note;
  DateTime date;

  TransactionModel({
    required this.category,
    required this.amount,
    required this.note,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "category": category,
      "amount": amount,
      "note": note,
      "date": date,
    };
  }
}
import '../models/transaction_model.dart';

List<Transaction> dummyTransactions = [
  Transaction(
      id: '1', amount: 50.0, date: DateTime.now().subtract(Duration(days: 1))),
  Transaction(
      id: '2', amount: 75.0, date: DateTime.now().subtract(Duration(days: 2))),
  Transaction(
      id: '3', amount: 100.0, date: DateTime.now().subtract(Duration(days: 3))),
];

// lib/models/user.dart
class User {
  final String name;
  final double balance;
  final List<Map<String, dynamic>> cards;
  final List<Map<String, dynamic>> incomingTransactions;
  final List<Map<String, dynamic>> outgoingTransactions;

  User({
    required this.name,
    required this.balance,
    required this.cards,
    required this.incomingTransactions,
    required this.outgoingTransactions,
  });
}

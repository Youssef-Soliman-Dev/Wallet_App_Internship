import 'package:flutter/material.dart';
import '../models/transaction_model.dart';
import '../extensions/date_extension.dart';

class DetailsScreen extends StatelessWidget {
  final Transaction transaction;

  DetailsScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Transaction ID: ${transaction.id}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Amount: \$${transaction.amount}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Date: ${transaction.date.toLocal().toShortDateString()}',
                style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

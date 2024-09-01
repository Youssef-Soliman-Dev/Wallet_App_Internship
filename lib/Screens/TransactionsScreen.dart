import 'package:flutter/material.dart';
import 'package:flutter_app/Screens/DetailsScreen.dart';
import '../data/dummy_data.dart';
import '../extensions/date_extension.dart';

class TransactionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
      ),
      body: ListView.builder(
        itemCount: dummyTransactions.length,
        itemBuilder: (ctx, index) {
          final transaction = dummyTransactions[index];
          return ListTile(
            title: Text('Amount: \$${transaction.amount}'),
            subtitle:
                Text('Date: ${transaction.date.toLocal().toShortDateString()}'),
            trailing: IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailsScreen(transaction: transaction),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

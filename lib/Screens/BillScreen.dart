import 'package:flutter/material.dart';

class BillScreen extends StatelessWidget {
  final List<Bill> bills = [
    Bill(
        type: 'Electricity',
        amount: 120.00,
        dueDate: DateTime(2024, 9, 10),
        paid: false),
    Bill(
        type: 'Water',
        amount: 45.00,
        dueDate: DateTime(2024, 9, 15),
        paid: false),
    Bill(
        type: 'Internet',
        amount: 60.00,
        dueDate: DateTime(2024, 9, 5),
        paid: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills'),
      ),
      body: ListView.builder(
        itemCount: bills.length,
        itemBuilder: (context, index) {
          final bill = bills[index];
          return ListTile(
            title: Text(bill.type),
            subtitle: Text('Due: ${bill.dueDate.toLocal()}'),
            trailing: Text('\$${bill.amount.toStringAsFixed(2)}'),
            tileColor: bill.paid ? Colors.green[100] : Colors.red[100],
            onTap: () => _showBillDetails(context, bill),
          );
        },
      ),
    );
  }

  void _showBillDetails(BuildContext context, Bill bill) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(bill.type),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Amount: \$${bill.amount.toStringAsFixed(2)}'),
              Text('Due Date: ${bill.dueDate.toLocal()}'),
              Text('Status: ${bill.paid ? 'Paid' : 'Unpaid'}'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            if (!bill.paid)
              TextButton(
                child: Text('Mark as Paid'),
                onPressed: () {
                  Navigator.of(context).pop();
                  // Add functionality to mark the bill as paid
                },
              ),
          ],
        );
      },
    );
  }
}

class Bill {
  final String type;
  final double amount;
  final DateTime dueDate;
  final bool paid;

  Bill({
    required this.type,
    required this.amount,
    required this.dueDate,
    required this.paid,
  });
}

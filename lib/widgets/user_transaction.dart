import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import 'new_transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _userTransaction = [
    Transaction(
      id: "t1",
      title: "New Shoes",
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Weekly Groceries",
      amount: 16.53,
      date: DateTime.now(),
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(this._userTransaction),
      ],
    );
  }
}


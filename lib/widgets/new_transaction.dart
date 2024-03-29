import 'dart:io';

import 'package:expense_tracker/widgets/adaptive_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNexTransaction;

  NewTransaction(this.addNexTransaction) {
    print("constructor of NewTransaction");
  }

  @override
  _NewTransactionState createState() {
    print("createState NewTransaction widget");
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = new TextEditingController();
  final _amountController = new TextEditingController();
  DateTime? _selectedDate = null;

  _NewTransactionState() {
    print('Constructor newTransaction State');
  }

  /*
  * used to fetch some initial data
  * * */
  @override
  void initState() {
    print('initState()');
    super.initState();
  }

  /**
   * called when update parent widget for get updates
   * */
  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  /*
  * used for clean up data
  * * */
  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final title = _titleController.text;
    final amount = (_amountController.text.isNotEmpty)
        ? double.parse(_amountController.text)
        : 0;

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    // this.widget need to access parent class pointer method
    this.widget.addNexTransaction(_titleController.text,
        double.parse(_amountController.text), _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    // this showDatePicker return a future
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                /*onChanged: (value) {
                          titleInput = value;
                        },*/
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) =>
                    _submitData(), // here _ means we ignore value here
                //and pass it to arrow function

                /*onChanged: (value) {
                          amountInput = value;
                        },*/
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date : ${DateFormat.yMd().format(_selectedDate!)}',
                      ),
                    ),
                    AdaptiveButton("Choose Date", _presentDatePicker),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _submitData,
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor, //background
                  onPrimary:
                      Theme.of(context).textTheme.button?.color, //font color
                ),
                child: Text('Add Transaction'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

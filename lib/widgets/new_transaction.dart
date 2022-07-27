import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNexTransaction;

  NewTransaction(this.addNexTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = new TextEditingController();
  final _amountController = new TextEditingController();
  DateTime? _selectedDate = null;

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
    this.widget.addNexTransaction(
        _titleController.text, double.parse(_amountController.text),_selectedDate);

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
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
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
                  TextButton(
                    style: TextButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                    ),
                    onPressed: _presentDatePicker,
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
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
    );
  }
}

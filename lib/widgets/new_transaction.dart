import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNexTransaction;

  NewTransaction(this.addNexTransaction);

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = (amountController.text.isNotEmpty)
        ? double.parse(amountController.text)
        : 0;

    print('title : ${title}');
    print('amount : ${amount}');

    if (title.isEmpty || amount <= 0) {
      return;
    }

    this.addNexTransaction(
        titleController.text, double.parse(amountController.text));
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
              controller: titleController,
              onSubmitted: (_) => submitData(),
              /*onChanged: (value) {
                        titleInput = value;
                      },*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) =>
                  submitData(), // here _ means we ignore value here
              //and pass it to arrow function

              /*onChanged: (value) {
                        amountInput = value;
                      },*/
            ),
            TextButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

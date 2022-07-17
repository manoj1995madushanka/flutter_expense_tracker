import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addNexTransaction;

  NewTransaction(this.addNexTransaction);

  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

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
              /*onChanged: (value) {
                        titleInput = value;
                      },*/
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              /*onChanged: (value) {
                        amountInput = value;
                      },*/
            ),
            TextButton(
              onPressed: () {
                print('title : ${titleController.text}');
                print('amount : ${amountController.text}');
                this.addNexTransaction(
                    titleController.text, double.parse(amountController.text));
              },
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

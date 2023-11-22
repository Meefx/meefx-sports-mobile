import 'package:flutter/material.dart';
// import 'package:meefx_sports/screens/inventory_form.dart';
import 'package:meefx_sports/models/item.dart';

class ItemInformation extends StatelessWidget {
  final Item item;

  const ItemInformation({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Information'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Name: ${item.fields.name}",
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text("Amount: ${item.fields.amount}"),
            const SizedBox(height: 10),
            Text("Description: ${item.fields.description}"),
          ],
        ),
      ),
    );
  }
}
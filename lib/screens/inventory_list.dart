import 'package:flutter/material.dart';
import 'package:meefx_sports/screens/inventory_form.dart';

class ItemListPage extends StatelessWidget {
  const ItemListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        centerTitle: true, // If you want to center the title as in your form page
        backgroundColor: Colors.indigo, // Matching the color scheme of the form page
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: ItemInventory.items.length,
        itemBuilder: (context, index) {
          final item = ItemInventory.items[index];
          return Card( // Wrap each item in a Card for better styling
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                item.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo, // Use a color scheme similar to your form page
                ),
              ),
              subtitle: Text(
                'Amount: ${item.amount}',
                style: TextStyle(color: Colors.black54), // Subdued color for the subtitle
              ),
              isThreeLine: true, // If you want to have space for an additional line of text
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 16.0,
              ),
              // You could also add an onTap to navigate to a detail page or similar
            ),
          );
        },
      ),
      // You might want to include a floating action button for adding new items
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const InventoryFormPage()),
          );
        },
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
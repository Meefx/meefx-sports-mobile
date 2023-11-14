import 'package:flutter/material.dart';
import 'package:meefx_sports/screens/inventory_form.dart';
import 'package:meefx_sports/screens/inventory_list.dart';
import 'package:meefx_sports/widgets/left_drawer.dart';
import 'package:meefx_sports/widgets/item_card.dart';


class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  
  final List<InventoryItem> items = [
    InventoryItem("Lihat Item", Icons.checklist, Colors.blue),
    InventoryItem("Tambah Item", Icons.add_shopping_cart, const Color.fromARGB(255, 65, 133, 167)),
    InventoryItem("Logout", Icons.logout, Colors.red),
  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo ,
        title: const Text(
          'Meefx Sports',
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'PBP Assignment', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((InventoryItem item) {
                  // Iterasi untuk setiap item
                  return InventoryCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


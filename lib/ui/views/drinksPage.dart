import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/drinksInformation.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
  List<Drinksinformation> drinksList = [];

  @override
  void initState() {
    super.initState();
    drinksList.add(Drinksinformation(id: 1, name: "Coca-Cola", price: 2));
    drinksList.add(Drinksinformation(id: 2, name: "Pepsi", price: 2));
    drinksList.add(Drinksinformation(id: 3, name: "Fanta", price: 2));
    drinksList.add(Drinksinformation(id: 4, name: "Sprite", price: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drinks"),
      ),
      body: ListView.builder(
        itemCount: drinksList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(drinksList[index].name),
            subtitle: Text("\$${drinksList[index].price}"),
          );
        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/foodsInformation.dart';

class Foods extends StatefulWidget {
  const Foods({super.key});

  @override
  State<Foods> createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  List<Foodsinformation> foodsList = [];

  @override
  void initState() {
    super.initState();
    foodsList.add(Foodsinformation(id: 1, name: "Pizza", price: 10));
    foodsList.add(Foodsinformation(id: 2, name: "Burger", price: 8));
    foodsList.add(Foodsinformation(id: 3, name: "Salad", price: 7));
    foodsList.add(Foodsinformation(id: 4, name: "Sandwich", price: 9));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Foods"),
      ),
      body: ListView.builder(
        itemCount: foodsList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(foodsList[index].name),
            subtitle: Text("\$${foodsList[index].price}"),
          );
        },
      ),
    );
  }
}
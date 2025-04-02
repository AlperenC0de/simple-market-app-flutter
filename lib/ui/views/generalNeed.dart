import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/generalNeedInformation.dart';

class Generalneed extends StatefulWidget {
  const Generalneed({super.key});

  @override
  State<Generalneed> createState() => _GeneralneedState();
}

class _GeneralneedState extends State<Generalneed> {
  List<Generalneedinformation> generalNeedList = [];

  @override
  void initState() {
    super.initState();
    generalNeedList.add(Generalneedinformation(id: 1, name: "Toilet Paper", price: 5));
    generalNeedList.add(Generalneedinformation(id: 2, name: "Shampoo", price: 10));
    generalNeedList.add(Generalneedinformation(id: 3, name: "Toothpaste", price: 8));
    generalNeedList.add(Generalneedinformation(id: 4, name: "Soap", price: 7));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Needs"),
      ),
      body: ListView.builder(
        itemCount: generalNeedList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(generalNeedList[index].name),
            subtitle: Text("\$${generalNeedList[index].price}"),
          );
        },
      ),
    );
  }
}
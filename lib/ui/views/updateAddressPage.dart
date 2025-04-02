import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/addressInformation.dart';

class Updateaddresspage extends StatefulWidget {
  const Updateaddresspage({super.key});

  @override
  State<Updateaddresspage> createState() => _UpdateaddresspageState();
}

class _UpdateaddresspageState extends State<Updateaddresspage> {
  var control1 = TextEditingController();
  var control2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold ekledik!
      appBar: AppBar(title: Text("Update Address")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: control1,
              decoration: InputDecoration(hintText: "Address Title"),
            ),
            SizedBox(height: 10), // Araya boşluk ekledik
            TextField(
              controller: control2,
              decoration: InputDecoration(hintText: "Address Description"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                var address = Addressinformation(
                  addressTitle: control1.text,
                  adress: control2.text,
                );
                Navigator.pop(context, address);
              },
              child: Text("ADD"),
            ),
          ],
        ),
      ),
    );
  }
}

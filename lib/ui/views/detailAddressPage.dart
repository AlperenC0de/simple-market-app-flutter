import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/addressInformation.dart';

class Detailaddresspage extends StatefulWidget {
  final Addressinformation address;
  Detailaddresspage({required this.address});
  @override
  State<Detailaddresspage> createState() => _UpdateaddresspageState();
}

class _UpdateaddresspageState extends State<Detailaddresspage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Address Detail"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(widget.address.addressTitle),
            Text(widget.address.adress),
          ],
        ),
      ),
    );
  }
}
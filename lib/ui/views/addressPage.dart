
import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/addressInformation.dart';
import 'package:flutter_application_10/ui/views/detailAddressPage.dart';
import 'package:flutter_application_10/ui/views/updateAddressPage.dart';

var addressesList=<Addressinformation>[];

class Addresspage extends StatefulWidget {
  const Addresspage({super.key});

  @override
  State<Addresspage> createState() => _AdresspageState();
}

class _AdresspageState extends State<Addresspage> {

  Future<List<Addressinformation>> uploadAdress() async{
    if(addressesList.isEmpty){
      var a1=Addressinformation(addressTitle: "Address 1", adress: "AAAA");
      var a2=Addressinformation(addressTitle: "Adress 2",adress: "BBBB");

      addressesList.add(a1);
      addressesList.add(a2);
    }
    

    return addressesList;

  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Adresses"),),
      body: FutureBuilder<List<Addressinformation>>(
        future: uploadAdress(), 
        builder: (context,snapshot){
          if(snapshot.hasData){
            var addressList=snapshot.data;
            return ListView.builder(
              itemCount: addressList!.length,
              itemBuilder: (context, index) {
                var address=addressList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Detailaddresspage(address: address)));
                  },
                  child: Card(
                    child: Center(
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(address.addressTitle),
                              Text(address.adress),
                            ],
                          ),
                          ElevatedButton(onPressed: (){
                            setState(() {
                              addressesList.removeAt(index);
                            });
                          }, child: Icon(Icons.clear)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          else{
            return const Center();
          }
        }
        ),
        floatingActionButton:FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> Updateaddresspage())).then((value){
              setState(() {
                if (value != null && value is Addressinformation) { // NULL CHECK VE TÜR KONTROLÜ
                  addressesList.add(value);
                }
              });
      
            
          });
        }, child: Icon(Icons.add),) ,
    );
  }
}
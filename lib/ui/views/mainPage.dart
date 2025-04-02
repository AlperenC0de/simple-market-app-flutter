import 'package:flutter/material.dart';
import 'package:flutter_application_10/data/entity/menuInformation.dart';
import 'package:flutter_application_10/ui/views/addressPage.dart';
import 'package:flutter_application_10/ui/views/drinksPage.dart';
import 'package:flutter_application_10/ui/views/foodsPage.dart';
import 'package:flutter_application_10/ui/views/generalNeed.dart';
import 'package:carousel_slider/carousel_slider.dart';



class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}



class _MainpageState extends State<Mainpage> {

  Future<List<Menuinformation>> uploadMenu() async{
    var menu=<Menuinformation>[];
    var m1=Menuinformation(name: "Fruits & Vegetables", picture:"fruitsandvegetables.png", type: "food");
    var m2=Menuinformation(name: "Dairy", picture:"dairy.png", type: "food");
    var m3=Menuinformation(name: "Frozen", picture:"frozen.png", type: "food");
    var m4=Menuinformation(name: "Beverages", picture:"beverages.png",type:"drink" );
    var m5=Menuinformation(name: "Meat", picture:"Meat.png",type: "food");
    var m6=Menuinformation(name: "Snacks", picture:"snacks.png", type: "food");
    var m7=Menuinformation(name: "Bakery", picture:"bakery.png", type: "food");
    var m8=Menuinformation(name: "Personalcare", picture:"personalcare.png",type: "personal");
    var m9=Menuinformation(name: "Household", picture:"household.png", type: "personal");
    menu.add(m1);
    menu.add(m2);
    menu.add(m3);
    menu.add(m4);
    menu.add(m5);
    menu.add(m6);
    menu.add(m7);
    menu.add(m8);
    menu.add(m9);

    return menu;
    
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getir", textAlign: TextAlign.center), // Centering title
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Addresspage()));
              },
              child: const Text("Address"),
            ),
          ),
        ],
      ),
      
      body: Column(
        children: [
          CarouselSlider(
            items: [
              Image.asset("images/banner1.png", fit: BoxFit.cover),
              Image.asset("images/banner2.jpg", fit: BoxFit.cover),
              Image.asset("images/banner3.png", fit: BoxFit.cover),
            ],
            options: CarouselOptions(
              height: 180,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 2.0,
              autoPlayInterval: Duration(seconds: 3),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Menuinformation>>(
              future: uploadMenu(), 
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var menuList=snapshot.data;
                  return GridView.builder(
                    itemCount: menuList!.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3 , childAspectRatio: 1/1),
                    itemBuilder: (context,index){
                      var menu=menuList[index];
                      return GestureDetector(
                        onTap: () {
                          if(menu.type=="food"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Foods()));
                          }
                          else if(menu.type=="drink"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Drinks()));
                          }
                          else if(menu.type=="personal"){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Generalneed()));
                          }
                        },
                        child: Card(
                          child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Image.asset("images/${menu.picture}")),
                              Text(menu.name),
                            ],
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
          ),
        ],
      ),
    );
  }
}
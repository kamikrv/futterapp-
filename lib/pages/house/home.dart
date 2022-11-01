import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:github_app/models/house.dart';
import 'package:github_app/pages/house/widgets/house_card.dart';
import '../house_description.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  List<House> houses = [];

  //Get document IDs
  Future getDocId() async{
    houses = [];
    await FirebaseFirestore.instance
        .collection('add_new')
        .orderBy('Price', descending: false)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              try{
                final house = House.fromFirebase(document.reference.id, document.data());
                houses.add(house);
              }catch(error){
                print("Firebase error: ${error.toString()}");
              }
            })
    );
  }

  //Hive storage load houses
  // @override
  // void didChangeDependencies() async {
  //   houses = await HiveStorage.loadHouses();
  //   super.didChangeDependencies();
  // }
  // refresh screen
  // Future refresh() async {
  //   houses = await HiveStorage.loadHouses();
  //   setState(()  {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Roof.kz'),
          centerTitle: true,
        ),
        // update data
        body: FocusDetector(
            onFocusGained: () {
              setState(() {});
              },
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                          child: FutureBuilder(
                              future: getDocId(),
                              builder: (context, snapshot){
                                // loading houses at home screen
                                return ListView.builder(
                                    itemCount: houses.length,
                                    itemBuilder: (context, index){
                                      final house = houses[index];
                                      return HouseCard(
                                          house: house,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>  HomeDescription(house: house,)),
                                            );
                                          }
                                          );
                                    }
                                    );
                              }
                              )
                      ),
                    ]
                )
            )
        )
    );
  }
}

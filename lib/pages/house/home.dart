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

  bool isRequesting = false;

  //Get document IDs
  Future getDocId() async{
    if (isRequesting) {
      return;
    }else{
      setState(() {
        isRequesting = true;
        houses = [];
      });
    }

    print('getDocId');

    await FirebaseFirestore.instance.collection('add_new').get()
        .then((snapshot) => snapshot.docs.forEach((document) {
      try{
        //print('dva');
        final house = House.fromFirebase(document.reference.id, document.data());
        houses.add(house);
        // print('tri');
      }catch(error){
        print("Firebase error: ${error.toString()}");
      }
    })
    );
    setState(() {
      isRequesting = false;
    });
  }

  @override
  void initState() {
    requestData();
    super.initState();
  }

  void requestData() async {
    await getDocId();
  }

  @override
  Widget build(BuildContext context) {
    print('begin');
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Roof.kz'),
          centerTitle: true,
        ),
        body: Padding(
          padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: FocusDetector(
              onFocusGained: () {
                requestData();
              },
              child: isRequesting
                ? const Center(
                    child: CircularProgressIndicator()
                ) : ListView.builder(
                itemCount: houses.length,
                itemBuilder: (context, index){
                  final house = houses[index];
                  print(houses.length);
                  //cards with houses
                  return HouseCard(
                      house: house,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  HomeDescription(house: house,)),
                        );
                      }
                  );
                  print('get');
                  }
                ),
            )
          )
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_app/local_storage/hive_storage.dart';
import 'package:github_app/models/house.dart';


class HomeDescription extends StatefulWidget {
  final House house;
  const HomeDescription({Key? key, required this.house}) : super(key: key);

  @override
  HomeDescriptionState createState() => HomeDescriptionState();
}

class HomeDescriptionState extends State<HomeDescription> {
  House? houseHive;

  Future init() async {
    final housesHive = await HiveStorage.loadHouses();
    for(final house in housesHive) {
      if (house.firebaseId == widget.house.firebaseId) {
        houseHive = house;
        setState(() {});
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Roof.kz'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                  houseHive == null ? Icons.star_border_outlined :
                  Icons.star
              ),
              onPressed: () async {
                if (houseHive == null) {
                  houseHive = await HiveStorage.saveHouse(widget.house);
                }else{
                  await houseHive?.delete();
                  houseHive = null;
                }
                setState(() {});
                },
            ),
              IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () async {
                    showDialog(context: context,
                        builder: (BuildContext context) =>
                            CupertinoAlertDialog(
                              title: const Text('Alert'),
                              content: const Text('Do you want to delete the ad?'),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  child: const Text("NO"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                                CupertinoDialogAction(
                                  isDefaultAction: true,
                                  child: const Text("Yes"),
                                  onPressed: () {
                                    try {
                                      FirebaseFirestore.instance.collection('add_new').doc(widget.house.firebaseId).delete();
                                      Navigator.pop(context);
                                      Navigator.pop(context);
                                    } catch (error) {
                                      print("Firebase error: ${error.toString()}");
                                    }
                                  },
                                ),
                              ],
                            )
                    );
                  }
              )
            ],
        ),
        body:FutureBuilder(
          future: init(),
          builder: (context, snapshot) {
            return Padding (
                padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
                child: Column(
                    children: [
                      Image(
                        image: NetworkImage(widget.house.url),
                        width: 500,
                        height: 500,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price:  ${widget.house.price}',style: const TextStyle(fontSize: 20),),
                          Text('Count of rooms:  ${widget.house.countRooms}',style: const TextStyle(fontSize: 20),),
                          Text('City:  ${widget.house.city}',style: const TextStyle(fontSize: 20),),
                          Text('Description:  ${widget.house.description}',style: const TextStyle(fontSize: 20, fontFamily: 'Areal'),),
                          const Padding(padding: EdgeInsets.only(left: 15),),
                        ],
                      ),
                    ]
                )
            );
          }
          )
    );
  }
}

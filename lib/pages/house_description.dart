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
                  widget.house.isFavorite ? Icons.star :
                  Icons.star_border_outlined
              ),
              onPressed: () async {
                widget.house.isFavorite = !widget.house.isFavorite;
                widget.house.save();
                setState(() {});
                },
            )
          ],
        ),
        body: Column(
            children: [
              Image(
                image: NetworkImage(widget.house.url),
                width: 950,
                height: 500,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price:  ${widget.house.price}'),
                  Text('Count of rooms:  ${widget.house.countRooms}'),
                  Text('City:  ${widget.house.city}'),
                  Text('Description:  ${widget.house.description}'),
                  const Padding(padding: EdgeInsets.only(left: 15),),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                    title: Text('Alert'),
                    content: Text('Do you want to delete the ad?'),
                    actions: <Widget>[
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text("NO"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: Text("Yes"),
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )
                  );
                  },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('Delete'),
              )
            ]
        )
    );
  }
}

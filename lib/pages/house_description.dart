import 'package:flutter/material.dart';
import 'package:github_app/local_storage/hive_storage.dart';
import 'package:github_app/models/house.dart';

class _HomeDescriptionState extends State {
  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}

class HomeDescription extends StatelessWidget {
  final House house;

  @override
 _HomeDescriptionState createState() => _HomeDescriptionState();


  const HomeDescription({Key? key, required this.house}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: Text('Roof.kz'),
          centerTitle: true,
          actions: <Widget> [
             IconButton(
                icon: Icon(Icons.star_border_outlined),
                onPressed: () async {
                  house.isFavorite =! house.isFavorite;
                  await HiveStorage.saveHouse(house);
                  setState(() {});
                },

            )
          ],

        ),
        body: Column(
            children: [
              Image(
                image: NetworkImage(house.url),
                width: 950,
                height: 500,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price:  ${house.price}'),
                  Text('Count of rooms:  ${house.countRooms}'),
                  Text('City:  ${house.city}'),
                  Text('Description:  ${house.description}'),
                  const Padding(padding: EdgeInsets.only(left: 15),),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  HiveStorage.deleteHouse(house);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // Background color
                ),
                child: const Text('Delete'),
              )
            ]
        )
    );
  }


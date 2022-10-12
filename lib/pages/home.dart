import 'package:flutter/material.dart';
import 'package:github_app/local_storage/hive_storage.dart';
import '../models/house.dart';
import 'house_description.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<House> houses = [];

  @override
  void didChangeDependencies() async {
    houses = await HiveStorage.loadHouses();
    super.didChangeDependencies();
  }

  Future refresh() async {
    houses = await HiveStorage.loadHouses();
    setState(()  {
    });
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey,
            title: const Text('Roof.kz'),
            centerTitle: true,
  ),
          body: RefreshIndicator(
          onRefresh: refresh,
          child: Padding(
          padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
            child: ListView.builder(
              itemCount: houses.length,
              itemBuilder: (BuildContext context, int index) {
                House house = houses[index];
                return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomeDescription(house: house,)),
                      );
                      },
                    child: Card(
                        shadowColor: Colors.grey,
                        elevation: 10,
                        child:
                        Padding(
                        padding:const EdgeInsets.fromLTRB(8, 16, 8, 16),
                           child:Row(
                            children: [
                               Image(
                                image: NetworkImage(house.url),
                                width: 150,
                                height: 150,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Price: ${house.price}'),
                                  Text('Count of rooms: ${house.countRooms}'),
                                  Text('City: ${house.city}'),
                                ]
                              ),
                            ]
                        )
                    ))
                );
              }
              ),
          ) )
      );
  }
}

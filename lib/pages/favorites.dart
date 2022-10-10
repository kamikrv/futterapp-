import 'package:flutter/material.dart';
import 'package:github_app/local_storage/hive_storage.dart';
import '../models/house.dart';
import 'house_description.dart';

class FavoritesTab extends StatefulWidget {
   const FavoritesTab({Key? key}) : super(key: key);

   @override
   State<FavoritesTab> createState() => _FavoritesTabState();
}


class _FavoritesTabState extends State<FavoritesTab> {
  List<House> houses = [];

  @override
  void didChangeDependencies() async {
    houses = await HiveStorage.loadHouses();
    super.didChangeDependencies();
  }

  Future refresh() async {
    await _getData();
    setState(()  {
    });
  }

  Future<void> _getData() async {
    houses.clear();
    List<House> allHouses = await HiveStorage.loadHouses();
    for (var h in allHouses) {
      if (h.isFavorite == true) {
        houses.add(h);
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
        ),
        body: RefreshIndicator(
          onRefresh: refresh,
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
                        child: Row(
                            children: [
                              Image(
                                image: NetworkImage(house.url),
                                width: 100,
                                height: 100,
                              ),
                              const SizedBox(width: 10),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Price: ' + house.price),
                                    Text('Count of rooms: ' + house.countRooms),
                                    Text('City: ' + house.city),
                                  ]
                              ),
                            ]
                        )
                    )
                );
              }
          ),)

    );
  }
}

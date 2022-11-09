import 'package:flutter/material.dart';
import 'package:github_app/models/house.dart';

class HouseCard extends StatelessWidget {
  final House house;
  final VoidCallback onTap;

  const HouseCard({super.key, required this.house, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Card(
            shadowColor: Colors.grey,
            elevation: 10,
            child: Padding(
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
                            Text('Price: ${house.price}',
                              style: const TextStyle(
                                  height: 2,
                                  fontSize: 15,
                                  color: Colors.black45),),
                            Text('Count of rooms: ${house.countRooms}',
                              style: const TextStyle(
                                  height: 2,
                                  fontSize: 15,
                                  color: Colors.black45),),
                            Text('City: ${house.city}',
                              style: const TextStyle(
                                  height: 2,
                                  fontSize: 15,
                                  color: Colors.black45),),
                          ]
                      ),
                    ]
                )
            )
        )
    );
  }

}
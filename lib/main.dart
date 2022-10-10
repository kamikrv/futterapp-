import 'package:flutter/material.dart';
import 'package:github_app/local_storage/hive_storage.dart';
import 'package:github_app/pages/add_new.dart';
import 'package:github_app/pages/favorites.dart';
import 'package:github_app/pages/home.dart';
import 'package:github_app/pages/my_profile.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/house.dart';
import 'package:flutter/cupertino.dart';



Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(HouseAdapter());

  // if (await HiveStorage.loadHouses().then((value) => value.isEmpty)) {
  //   var house1 = House(price: '76 000 000', countRooms: '4 bedrooms', city: 'Almaty', description: 'Description of this house 1', url: 'https://www.bhg.com/thmb/a-NwJnw4qLipa1EWsJThQyc7Bik=/1280x1280/smart/filters:no_upscale():focal(899x639:901x641)/white-modern-house-curved-patio-archway-c0a4a3b3-aa51b24d14d0464ea15d36e05aa85ac9.jpg', area: '150', isFavorite: false);
  //   var house2 = House(price: '67 700 000', countRooms: '5 bedrooms', city: 'Astana', description: 'Description of this house 2', url: 'https://i.pinimg.com/originals/53/7f/dd/537fddf72eff85c33baf82c0d57663f8.jpg', area: '200', isFavorite: false);
  //   var house3 = House(price: '82 000 000', countRooms: '5 bedrooms', city: 'Almaty', description: 'Description of this house 3', url: 'https://i.pinimg.com/originals/61/1b/42/611b42450290ec0ec18ace2fdc0a7045.jpg', area: '100');
  //   var house4 = House(price: '43 000 000', countRooms: '3 bedrooms', city: 'Astana', description: 'Description of this house 4', url: 'https://i.pinimg.com/originals/f6/c4/fd/f6c4fde1805938fa6716716bd6ac8d5f.jpg', area: '90');
  //   List<House> houses = [house1, house2, house3, house4];
  // }

  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey,
    ),
    home: const MyHomePage (),
  )
  );
  }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _tabs = [
    Home(),
    const FavoritesTab(),
    AddNewTab(),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
              items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
              label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: 'Favorites'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add),
                label: 'Add new'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'My profile'),
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              return _tabs[index];
        },
    );
  }
}


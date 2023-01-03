//import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:github_app/pages/add_new.dart';
import 'package:github_app/pages/favorites.dart';
import 'package:github_app/pages/house/home.dart';
import 'package:github_app/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:github_app/pages/profile_page.dart';
import 'package:hive_flutter/adapters.dart';
import 'models/house.dart';



Future<void> main() async {
  await Hive.initFlutter();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Hive.registerAdapter(HouseAdapter());

  runApp(
    MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home: const MainPage (),
      )
    );
  }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //late PageController _pageController;
  //int _Page=0;

  // @override
  // void initState() {
  //   super.initState();
  //   _pageController = PageController();
  // }

  final  _tabs = [
    const Home(),
    const FavoritesTab(),
    const AddNewTab(),
    const ProfileTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: CupertinoTabScaffold(
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
        // body: PageView(
        //     controller: _pageController,
        //     children: const <Widget>[
        //       Home(),
        //       FavoritesTab(),
        //       AddNewTab(),
        //       ProfileTab()
        //     ],
        //     onPageChanged: (int index) {
        //       setState(() {
        //         _pageController.jumpToPage(index);
        //       });
        //     }
        // ),

    //     bottomNavigationBar: CurvedNavigationBar(
    //   backgroundColor: Colors.transparent,
    //     color: Colors.grey,
    //     animationDuration: const Duration(milliseconds: 500),
    //       animationCurve: Curves.easeInOutBack,
    //       index:3,
    //       items: const <Widget> [
    //         Icon(Icons.home, color: Colors.white,),
    //         Icon(Icons.star, color: Colors.white,),
    //         Icon(Icons.add, color: Colors.white,),
    //         Icon(Icons.person, color: Colors.white,),
    //       ],
    //     onTap: (index){
    // _pageController.jumpToPage(index);
    //     },)
    )
    );
  }
}


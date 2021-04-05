import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screen/cart.dart';
import 'package:flutter_app/screen/homescreen.dart';
import 'package:flutter_app/screen/myorder.dart';
import 'package:flutter_app/screen/profile.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int pageIndex = 0;

  final HomeScreen _homeScreen = HomeScreen();
  final CartScreen _cartScreen = CartScreen();
  final ProfileScreen _profileScreen = ProfileScreen();
  final MyOrder _myOrder = MyOrder();
  Widget _showPage = HomeScreen();
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _homeScreen;
        break;
      case 1:
        return _cartScreen;
        break;
      case 2:
        return _profileScreen;
        break;
      case 3:
        return _myOrder;
      default:
        return Container(
          child: Center(
            child: Text(
              'No page found by page chooser',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        );
    }
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        color: Colors.white,
        backgroundColor: Colors.orange,
        buttonBackgroundColor: Colors.white,
        items: [
          Icon(
            Icons.home,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.card_travel,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.supervised_user_circle_sharp,
            size: 20,
            color: Colors.black,
          ),
          Icon(
            Icons.bookmark_border_sharp,
            size: 20,
            color: Colors.black,
          ),
        ],
        animationDuration: Duration(
          microseconds: 200,
        ),
        animationCurve: Curves.bounceInOut,
        onTap: (int tappedIndex) {
          setState(() {
            _showPage = _pageChooser(tappedIndex);
          });
        },
      ),
      body: Center(
        child: _showPage,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

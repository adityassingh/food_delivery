import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: "http://quarantinecravings.in/",
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        },
        child: const Icon(Icons.home_rounded),
        backgroundColor: Colors.deepOrange,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

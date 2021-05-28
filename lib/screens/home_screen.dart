import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  

 final _auth =FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Agriculture Products"),backgroundColor: Colors.green,),
      
       body:Center(
         child:Text("HomeScreen"),
         
       ),
       drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text('hello'),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Shop by Category'),
              onTap: () {
                Navigator.pushNamed(context, '/fourth');
              },
            ),
            ListTile(
              title: Text('Sign out'),
              onTap: () async{
                 await _auth.signOut();
                 Navigator.pushNamed(context,'/' ) ;

                },
            ),
          ],
        ),
      ),
    );
  }
}



import 'package:ag/screens/category.dart';
import 'package:ag/screens/login_screen.dart';
import 'package:ag/screens/onboard_screen.dart';
import 'package:ag/screens/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context)=>HomeScreen(),
        '/first':(context)=>OnBoardScreen(),
        '/second':(context)=>InitializerWidget(),
        '/third':(context)=>HomeScreen(),
        '/fourth':(context)=>category(),
      },
    );
  }
}

class InitializerWidget extends StatefulWidget {
  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  
  FirebaseAuth _auth;

  User _user;

  bool isLoading =true;

  @override
  void initState() {
    
    super.initState();
    _auth=FirebaseAuth.instance;
    _user=_auth.currentUser;
    isLoading=false;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return isLoading ? Scaffold(
      body: Center(child:CircularProgressIndicator(),
      ),
    ) : _user ==null ? LoginScreen() : HomeScreen();
  }
}


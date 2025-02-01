import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartdnd/components/appbar.dart';
import 'package:smartdnd/components/card.dart';
import 'package:smartdnd/components/registerform.dart';
import 'package:smartdnd/components/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( 
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),

      routes:{
        '/':(context) => SplashScreen(),
        '/home':(context) => MyHomePage(title: "SmartDND"),
        '/register':(context) => RegisterForm()
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map<String,dynamic> data = {
    "title":"Add Device",
    "desc":"Have a pre-flashed that is ready to be connected to EchoBlock?",
    "color":Colors.white54,
    "bg":Colors.black45,
    "icon":Icon(Icons.add,color: Colors.grey,size: 45,),
    "font":GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white)
  };

  // void _incrementCounter() {
  //   setState(() {
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,),
      home: Scaffold(
        appBar: SmartAppBar(),
        body:  Column(
          
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0,),
              CardComponent(data: data,)
            ],
          ),
      ),
    );
  }
}

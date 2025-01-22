import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartdnd/components/appbar.dart';
import 'package:smartdnd/components/card.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  Map<String,dynamic> data = {
    "title":"Add Device",
    "desc":"Have a pre-flashed that is ready to be connected to EchoBlock?",
    "color":Colors.white54,
    "bg":Colors.black45,
    "icon":Icon(Icons.add,color: Colors.grey,size: 40,),
    "font":GoogleFonts.roboto(fontSize: 15,fontWeight: FontWeight.w300,color: Colors.white)
  };

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {


   
    return Scaffold(
      appBar: SmartAppBar(),
      body:  Column(
        
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CardComponent(data: data,)
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), 
    );
  }
}

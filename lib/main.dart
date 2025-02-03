import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:smartdnd/components/appbar.dart';
import 'package:smartdnd/components/card.dart';
import 'package:smartdnd/components/registerform.dart';
import 'package:smartdnd/components/splashscreen.dart';
import 'package:smartdnd/services/statuscontroller.dart';
import 'package:wifi_iot/wifi_iot.dart';
import 'package:http/http.dart' as http;

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
        showSemanticsDebugger: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),

        // home: const MyHomePage(title: 'Flutter Demo Home Page'),

        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => MyHomePage(title: "SmartDND"),
          '/register': (context) => RegisterForm()
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> buttons = [
    {"color": Colors.pink, "label": "On", "value": "ON"},
    {"color": Colors.black87, "label": "Off", "value": "OFF"},
    {"color": Colors.red, "label": "Red"},
    {"color": Colors.green, "label": "Green"},
    {"color": Colors.blue, "label": "Blue"},
    {"color": Colors.orange, "label": "Orange"},
    {"color": Colors.purple, "label": "Purple"},
    {"color": Colors.yellow, "label": "Yellow"},
  ];

  Map<String, dynamic> data = {
    "title": "Add Device",
    "desc": "Have a pre-flashed that is ready to be connected to EchoBlock?",
    "color": Colors.white54,
    "bg": Colors.black45,
    "icon": Icon(
      Icons.add,
      color: Colors.grey,
      size: 45,
    ),
    "font": GoogleFonts.roboto(
        fontSize: 15, fontWeight: FontWeight.w300, color: Colors.white)
  };

  @override
  void initState() {
    super.initState();
    requestPermissions();
    scanWiFi();
  }

  List<WifiNetwork> _networks = [];

  // 🔹 Scan for Wi-Fi networks
  Future<void> scanWiFi() async {
    List<WifiNetwork>? networks = await WiFiForIoTPlugin.loadWifiList();
    setState(() {
      _networks = networks ?? [];
    });
  }

  // Request permissions for Wi-Fi
  Future<void> requestPermissions() async {
    await [
      Permission.location,
      Permission.nearbyWifiDevices,
    ].request();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: SmartAppBar(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10.0,
            ),
            CardComponent(
              data: data,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 Columns
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2, // Adjust height
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    return ElevatedButton(
                      onPressed: () {
                        final url = Uri.parse(
                            'http://192.168.4.1/${buttons[index]['value']}');
                        print(url);
                        http.get(url);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttons[index]["color"],
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        buttons[index]["label"],
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

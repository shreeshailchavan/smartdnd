import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:smartdnd/utilities/wifiform.dart';
import 'package:wifi_iot/wifi_iot.dart';

class CardComponent extends StatefulWidget {
  Map<String, dynamic> data = {
    'title': "",
    'color': Colors,
    'bg': Colors,
    "font": GoogleFonts
  };
  CardComponent({required this.data});

  @override
  State<CardComponent> createState() => _CardComponent();
}

class _CardComponent extends State<CardComponent> {
  late bool isConnectedToWifi = false;
  late String access_point = "";
  void showWiFiModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Connect to Wi-Fi"),
          content: ReactiveForm(
            formGroup: wifiForm,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ReactiveTextField<String>(
                    formControlName: 'ssid',
                    decoration: InputDecoration(labelText: "Wi-Fi SSID"),
                  ),
                  SizedBox(height: 10),
                  ReactiveTextField<String>(
                    formControlName: 'password',
                    decoration: InputDecoration(labelText: "Wi-Fi Password"),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      print(wifiForm.control('ssid').value + " " + wifiForm.control('password').value);
                      if (wifiForm.valid) {
                        connectToWiFi(
                          wifiForm.control('ssid').value,
                          wifiForm.control('password').value,
                        );
                        print(wifiForm);
                        Navigator.pop(context); // Close modal
                      }
                    },
                    child: Text("Connect"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
 
  Future<void> connectToWiFi(String ssid, String password) async {
    bool success = await WiFiForIoTPlugin.connect(ssid, password: password);
    if (success) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Connected to $ssid")));
      setState(() {
        isConnectedToWifi = !isConnectedToWifi;
        access_point = "http://192.168.4.1";
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Failed to connect")));
    }
  }

  TextStyle robotoFont = GoogleFonts.roboto(fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card.outlined(
      elevation: 2.0,
      shadowColor: Colors.grey,
      clipBehavior: Clip.hardEdge,
      child: Container(
        height: 200,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(5.0)),
        child: Column(
          children: <Widget>[
            (widget.data['img'] != null)
                ? Column(
                    children: <Widget>[],
                  )
                : InkWell(
                    splashColor: Colors.blueGrey,
                    splashFactory: InkRipple.splashFactory,
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5))),
                              height: 300,
                              // color: Colors.white,
                              child: ListView(
                                scrollDirection: Axis.vertical,
                                children: <Widget>[
                                  ListTile(
                                    style: ListTileStyle.list,
                                    minTileHeight: 50,
                                    contentPadding: EdgeInsets.all(5.0),
                                    title: Text(
                                      "Add Device",
                                      style: GoogleFonts.roboto(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                  ),
                                  ListTile(
                                    onTap: () => showWiFiModal(context),
                                    style: ListTileStyle.list,
                                    minTileHeight: 50,
                                    contentPadding: EdgeInsets.all(5.0),
                                    leading: Icon(
                                      Icons.wifi,
                                      size: 20,
                                    ),
                                    title: Text(
                                      "Find devices nearby",
                                      style: robotoFont,
                                    ),
                                    subtitle: Text(
                                      "Find and connect nearby devices",
                                      style: robotoFont,
                                    ),
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                  ),
                                  ListTile(
                                    style: ListTileStyle.list,
                                    minTileHeight: 50,
                                    contentPadding: EdgeInsets.all(5.0),
                                    leading: Icon(
                                      Icons.bluetooth,
                                      size: 20,
                                    ),
                                    title: Text("Find devices nearby",
                                        style: robotoFont),
                                    subtitle: Text(
                                      "Find and connect nearby devices",
                                      style: robotoFont,
                                    ),
                                    titleAlignment:
                                        ListTileTitleAlignment.center,
                                  )
                                ],
                              ));
                        },
                      );
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          widget.data['icon'],
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "${widget.data["title"]}",
                            style: GoogleFonts.roboto(
                                fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            widget.data['desc'],
                            style: widget.data['font'],
                          )
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

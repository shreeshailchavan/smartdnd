import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardComponent extends StatelessWidget {
  Map<String, dynamic> data = {
    'title': "",
    'color': Colors,
    'bg': Colors,
    "font": GoogleFonts
  };

  TextStyle robotoFont = GoogleFonts.roboto(fontWeight: FontWeight.w500);
  CardComponent({required this.data});

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
            (this.data['img'] != null)
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
                                    style: ListTileStyle.list,
                                    minTileHeight: 50,
                                    contentPadding: EdgeInsets.all(5.0),
                                    leading: Icon(
                                      Icons.wifi,
                                      size: 20,
                                    ),
                                    title: Text("Find devices nearby" , style: robotoFont,),
                                    subtitle:
                                        Text("Find and connect nearby devices",style: robotoFont,),
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
                                    title: Text("Find devices nearby",style: robotoFont),
                                    subtitle:
                                        Text("Find and connect nearby devices",style: robotoFont,),
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
                          this.data['icon'],
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "${data["title"]}",
                            style: GoogleFonts.roboto(
                                fontSize: 20, color: Colors.white),
                          ),
                          SizedBox(height: 5),
                          Text(
                            this.data['desc'],
                            style: this.data['font'],
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

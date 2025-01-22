import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardComponent extends StatelessWidget {
  Map<String, dynamic> data = {
    'title': "",
    'color': Colors,
    'bg': Colors,
    "font": GoogleFonts
  };
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
                : Container(
                  width:double.maxFinite,
                  padding:EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        this.data['icon'],
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "${data["title"]}",
                          style: GoogleFonts.roboto(fontSize: 20,color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(this.data['desc'],style: this.data['font'],)
                      ],
                    ),
                ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}

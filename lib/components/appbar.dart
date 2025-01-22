import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SmartAppBar extends StatelessWidget implements PreferredSizeWidget{
  const SmartAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("SmartDND",style:GoogleFonts.poppins(fontWeight: FontWeight.bold)),
      leading: Icon(Icons.dnd_forwardslash,color: Colors.black,weight: 20.0,),
      actions: <Widget>[
        IconButton(onPressed: ()=>null, icon:Icon(Icons.account_circle,color: Colors.black,weight: 20,size: 30.0,))
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

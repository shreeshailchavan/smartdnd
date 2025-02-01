import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          Center(child: Image.asset("assets/images/dndlogo.png")),
          Positioned(
            bottom: 20, // Adjust as needed
            left: 20,
            right: 20, // Adjust as needed
            child: InkWell(
              splashColor: Colors.black87,
              splashFactory: InkRipple.splashFactory,
              child:  Column(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(8),
                ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/home'); // Navigate using named route
                        },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero, // Remove default padding
                         shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Prevents extra margin
                        ),
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                  // color: Colors.indigo,
                  borderRadius: BorderRadius.circular(8),
                ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, '/home'); // Navigate using named route
                        },
                        style: TextButton.styleFrom(
                          
                          backgroundColor: Colors.indigoAccent,
                          padding: EdgeInsets.zero, // Remove default padding
                          shape:
                              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), // Prevents extra margin
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}

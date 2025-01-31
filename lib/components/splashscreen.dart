import 'package:flutter/material.dart';
import 'package:smartdnd/main.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void goToHome() {
      Navigator.pushNamed(context, "/home");
      Navigator.pop(context);
    }

    return Material(
      child: Stack(
        children: <Widget>[
          Center(child: Image.asset("assets/images/dndlogo.png")),
          Positioned(
            bottom: 20, // Adjust as needed
            left: 20,
            right: 20, // Adjust as needed
            child: InkWell(
              splashColor: Colors.grey,
              splashFactory: InkRipple.splashFactory,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
            Navigator.pushNamed(context, '/home'); // Navigate using named route
          },
                      style: TextButton.styleFrom(
      padding: EdgeInsets.zero, // Remove default padding
      shape: RoundedRectangleBorder(), // Prevents extra margin
    ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

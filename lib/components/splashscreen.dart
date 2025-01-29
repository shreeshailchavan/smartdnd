import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
              Center(
                
                  child: Image.network(
                      "https://macreports.com/wp-content/uploads/2023/03/do-not-disturb-featured.png")),
           Positioned(
              bottom: 20, // Adjust as needed
              left: 20,
              right: 20,   // Adjust as needed
              child: Container(
                
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    InkWell(
                       splashColor: Colors.white.withOpacity(0.3),
                      child: ElevatedButton(
                        onPressed: null,
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

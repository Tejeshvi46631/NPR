import 'package:flutter/material.dart';
import 'package:npr/View/loginScreen.dart';
import 'package:npr/View/roleselection.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add a 3-second delay before navigating to MyLogin screen
    Future.delayed(Duration(seconds: 3), () {
      // Navigate to MyLogin screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => RoleSelection()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.white, // Change this to any background color you like
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Load the image asset
            Image.asset(
              'assets/images/NPR_logo.jpg',
              width: 200, // Adjust the size as needed
              height: 200,
            ),
            SizedBox(height: 20), // Add space between the image and the text
            // Display the main text
            Text(
              'National Population Center',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors
                    .blueAccent, // Change the color to make it more attractive
              ),
            ),
            SizedBox(height: 10), // Add space between the two text elements
            // Display the subtext
            Text(
              'Developed and Managed by CDAC Mumbai',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.grey[600], // Light grey for subtle effect
              ),
            ),
          ],
        ),
      ),
    );
  }
}

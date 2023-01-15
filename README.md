import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/opponent_two.dart';

import '../../constants.dart';
import '../../main.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';
void main() => runApp(const MyApp());

class OnePage extends StatelessWidget {
  const OnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/opponent_one.png'),
          ),
          Positioned(
            // Use Positioned widget to place the button at the bottom of the page
            bottom: 26,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 80,  // Set the desired height of the button
              width: 80,  // Set the desired width of the button
              child: FloatingActionButton(
                // Use a FloatingActionButton widget to create a circular button
                onPressed: () async {
                  // Show the dialog with the CircularProgressIndicator
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text("Matching Please wait..."),
                          ],
                        ),
                      ),
                    ),
                  );
                  // Perform some async operation
                  await Future.delayed(Duration(seconds: 10));

                  // Navigate to the OnePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TwoPage(),
                    ),
                  );
                },
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}




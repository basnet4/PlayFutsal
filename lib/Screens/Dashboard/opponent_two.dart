import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/opponent_two.dart';

import '../../constants.dart';
import '../../main.dart';
import 'accpeted_ch.dart';
import 'opponent_one.dart';

void main() => runApp(const MyApp());

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/opponent_two.png'),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 170, left: 40),
              child: InkWell(
                highlightColor: Colors.grey[300],
                splashColor: Colors.grey[100],
                onTap: () async {
                  // Show the dialog with the CircularProgressIndicator
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        height: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 30),
                            Text("A challenge request has been sent "
                                "to the opponent. Please wait for confirmation."),
                          ],
                        ),
                      ),
                    ),
                  );

                  // Perform some async operation
                  await Future.delayed(Duration(seconds: 16));

                  // Navigate to the OnePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AcceptedPage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Challenge',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 170, right: 40),
              child: InkWell(
                highlightColor: Colors.grey[300],
                splashColor: Colors.grey[100],
                onTap: () async {
                  // Show the dialog with the CircularProgressIndicator
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                            SizedBox(height: 20),
                            Text("Matching..."),
                          ],
                        ),
                      ),
                    ),
                  );

                  // Perform some async operation
                  await Future.delayed(const Duration(seconds: 7));

                  // Navigate to the OnePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnePage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
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

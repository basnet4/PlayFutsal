import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/opponent_one.dart';

import '../../constants.dart';
import '../../main.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';
import 'dashboard.dart';

void main() => runApp(const MyApp());

class DashboardReturn extends StatelessWidget {
  const DashboardReturn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/dashboard_return.png'),
          ),
          Positioned(
            // Use Positioned widget to place the button at the bottom of the page
            bottom: 30,
            left: 16,
            right: 16,
            child: SizedBox(
              height: 75,  // Set the desired height of the button
              width: 75,  // Set the desired width of the button
              child: FloatingActionButton(
                // Use a FloatingActionButton widget to create a circular button
                onPressed: () async {
                  // Show the dialog with the CircularProgressIndicator
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        content: SizedBox(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(height: 15),
                              Text("Matching..."),
                            ],
                          ),
                        ),
                        actions: [
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context); // Close the dialog
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DashboardReturn(),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                  );
                  // Perform some async operation
                  await Future.delayed(Duration(seconds: 10));

                  // Navigate to the OnePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OnePage(),
                    ),
                  );
                },
                child: const Text(
                  "Start",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 48,
            right: 16,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 17,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Exit'),
                      content: const Text('Are you sure you want to exit the app?'),
                      actions: <Widget>[
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 50,
                            width: 150,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Center(
                              child: Text(
                                'Yes',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            height: 50,
                            width: 150,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: const Center(
                              child: Text(
                                'No',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                child: Image.asset('assets/images/exit.png'),
              ),
            ),
          ),
          // Positioned(
          //   bottom: 30,
          //   right: 168,
          //   child: Container(
          //     height: 75,
          //     width: 75,
          //     child: InkWell(
          //       onTap: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => const DashboardPage(),
          //           ),
          //         );
          //       },
          //       child: Image.asset('assets/images/bravo_team.png'),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

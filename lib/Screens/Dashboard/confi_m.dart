import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../main.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';
import 'dashboar_return.dart';
import 'dashboard.dart';
void main() => runApp(const MyApp());

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/confir_m.png'),
          ),
          // Positioned(
          //   bottom: 28,
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
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 150),
              child: InkWell(
                highlightColor: Colors.grey[300],
                splashColor: Colors.grey[100],
                onTap: () async {
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
                              Text("Please Wait"),
                            ],
                          ),
                        ),
                        // actions: [
                        //   InkWell(
                        //     child: Container(
                        //       decoration: BoxDecoration(
                        //         color: Colors.grey[200],
                        //         borderRadius: BorderRadius.circular(30),
                        //       ),
                        //       child: const Padding(
                        //         padding: EdgeInsets.all(8.0),
                        //         child: Text(
                        //           "Cancel",
                        //           style: TextStyle(
                        //             color: Colors.black,
                        //             fontSize: 18,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ],
                      )
                  );

                  // Perform some async operation
                  await Future.delayed(const Duration(seconds: 1));

                  // Navigate to the OnePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardReturn(),
                    ),
                  );
                },
                child: Container(
                  height: 45,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                  ),
                  child: const Center(
                    child: Text(
                      'Done',
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

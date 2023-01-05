import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../main.dart';
import '../Login/login_screen.dart';
import '../Signup/signup_screen.dart';
void main() => runApp(const MyApp());

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Image.asset('assets/images/dashboard_top.png'),
      ),
    );
  }
}
//
// class DashboardPage extends StatelessWidget {
//   const DashboardPage({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Hero(
//           tag: "login_btn",
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) {
//                     return const LoginScreen();
//                   },
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//                 backgroundColor: kPrimaryColor, elevation: 0),
//             child: Text(
//               "Login".toUpperCase(),
//               style: const TextStyle(fontSize: 18,color: Color(0xffdff7fe),
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//         const SizedBox(height: 10),
//       ],
//     );
//   }
// }
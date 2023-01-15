import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Dashboard/dashboard.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_auth/Screens/Dashboard/confi_m.dart';
import 'package:intl/intl.dart';

import '../../constants.dart';
import '../../main.dart';
void main() => runApp(const MyApp());

class AcceptedPage extends StatefulWidget {
  const AcceptedPage({Key? key}) : super(key: key);

  @override
  _AcceptedPageState createState() => _AcceptedPageState();
}

class _AcceptedPageState extends State<AcceptedPage> {
  String dvalue = 'Venue';
  String tvalue = 'Time';
  // late DateTime dataInput;

  get dateInput => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Image.asset('assets/images/accepted_ch.png'),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 120),
              child: InkWell(
                highlightColor: Colors.grey[300],
                splashColor: Colors.grey[100],
                onTap: () async {
                  // Show the dialog with the CircularProgressIndicator
                  showDialog(
                    context: context,
                    builder: (context) =>
                        AlertDialog(
                          content: SizedBox(
                            height: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                                SizedBox(height: 20),
                                Text(
                                    "Don't go anywhere! Confirmation is almost here."),
                              ],
                            ),
                          ),
                        ),
                  );

                  // Perform some async operation
                  await Future.delayed(const Duration(seconds: 8));

                  // Navigate to the OnePage
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ConfirmPage(),
                    ),
                  );
                },
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey,
                  ),
                  child: const Center(
                    child: Text(
                      'Book Now',
                      style: TextStyle(color: Colors.white,
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 314, left: 60),
              child: DropdownButton<String>(
                value: dvalue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 15,
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  // Update the value of the dropdown list box here
                  setState(() {
                    dvalue = newValue!;
                  });
                },
                items: <String>['Venue', 'Hamro Futsal', 'Players Futsal',
                  'Dhuku Futsal', 'Mates Futsal', 'DIG Futsal', 'United Futsal'
                  , 'Busy Futsal', 'Field Futsal', 'Kumari Futsal']
                    .map<DropdownMenuItem<String>>((String dvalue) {
                  return DropdownMenuItem<String>(
                    value: dvalue,
                    child: Text(dvalue),
                  );
                }).toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 190, left: 70),
              child: DropdownButton<String>(
                value: tvalue,
                icon: const Icon(Icons.arrow_downward),
                iconSize: 15,
                elevation: 16,
                style: const TextStyle(color: Colors.green),
                underline: Container(
                  height: 2,
                  color: Colors.green,
                ),
                onChanged: (String? newValue) {
                  // Update the value of the dropdown list box here
                  setState(() {
                    tvalue = newValue!;
                  });
                },
                items: <String>['Time', '2-3 P.M', '3-4 P.M',
                  '4-5 P.M', '5-6 P.M', '6-7 P.M']
                    .map<DropdownMenuItem<String>>((String tvalue) {
                  return DropdownMenuItem<String>(
                    value: tvalue,
                    child: Text(tvalue),
                  );
                }).toList(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(bottom: 255, left: 55),
              child: SizedBox(
                width: 120,
                height: 30,
                child: TextField(
                  controller: dateInput,
                  //editing controller of this TextField
                  decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Enter Date" //label text of field
                  ),
                  readOnly: true,
                  //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2100));

                    if (pickedDate != null) {
                        print(
                          pickedDate);
                      //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);
                      //formatted date output using intl package =>  2021-03-16
                      setState(() {
                        dateInput.text = formattedDate; //set output date to TextField value.
                      });
                    } else {}
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

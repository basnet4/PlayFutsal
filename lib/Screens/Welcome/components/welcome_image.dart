import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "WELCOME",
          style: TextStyle(color: Color(0xffdff7fe), fontWeight: FontWeight.bold,
              height: -1, fontFamily: 'Roboto' , fontSize: 60),
        ),
        const Text(
          "TO",
          style: TextStyle(color: Color(0xffdff7fe), fontWeight: FontWeight.bold,
              height: 0, fontFamily: 'Roboto' , fontSize: 30),
        ),
                const SizedBox(height: defaultPadding * 0),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 7,
              child: SvgPicture.asset(
                "assets/icons/chat.svg",
              ),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 1.5),
      ],
    );
  }
}
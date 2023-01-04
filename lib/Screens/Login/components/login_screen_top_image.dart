import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class LoginScreenTopImage extends StatelessWidget {
  const LoginScreenTopImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: defaultPadding * 0),
        Row(
          children: [
            const Spacer(),
            Expanded(
              flex: 10,
              child: SvgPicture.asset("assets/icons/login.svg", width: 300),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(height: defaultPadding * 1),
      ],
    );
  }
}
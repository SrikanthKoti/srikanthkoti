import 'package:flutter/material.dart';

class LoginBgImg extends StatelessWidget {
  const LoginBgImg({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Image.asset(
            'images/login_bg.jpg',
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

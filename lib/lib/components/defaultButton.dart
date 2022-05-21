import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class defultButton extends StatelessWidget {
  const defultButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getPropertionteScreenHeight(56),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: kPrimaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            )),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getPropertionatesScreenWidth(18),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../size_config.dart';

class RoundedIconsBtn extends StatelessWidget {
  const RoundedIconsBtn({
    Key? key,
    required this.IconData,
    required this.press,
  }) : super(key: key);
  final IconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getPropertionatesScreenWidth(40),
      width: getPropertionatesScreenWidth(40),
      child: ElevatedButton(
        onPressed: press,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          primary: Colors.white,
          onPrimary: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Icon(
          IconData,
        ),
      ),
    );
  }
}

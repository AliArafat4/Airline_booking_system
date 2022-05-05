import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

SizedBox ProfilePic() {
  return SizedBox(
    height: 115,
    width: 115,
    child: Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[400],
          backgroundImage: AssetImage("assets/images/Profile Image.png"),
        ),
        Positioned(
          right: -12,
          bottom: 0,
          child: SizedBox(
            height: 46,
            width: 46,
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  EdgeInsets.zero,
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xfff5f6f9)),
              ),
              onPressed: () {},
              child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
            ),
          ),
        )
      ],
    ),
  );
}

import 'package:flutter/material.dart';
import '../../../size_config.dart';

class SplachContent extends StatelessWidget {
  const SplachContent({
    Key? key,
    this.image = "image",
    this.title = "title",
    this.descreption = "descreption",
  }) : super(key: key);
  final String image, title, descreption;

  get kPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          title,
          style: TextStyle(
            fontSize: getPropertionatesScreenWidth(36),
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          descreption,
          textAlign: TextAlign.center,
        ),
        Spacer(flex: 2),
        Image.asset(
          image,
          height: getPropertionteScreenHeight(265),
          width: getPropertionatesScreenWidth(235),
        ),
      ],
    );
  }
}

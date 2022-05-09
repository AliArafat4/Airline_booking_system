import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../size_config.dart';

class CustomSufficIcon extends StatelessWidget {
  const CustomSufficIcon({
    Key? key,
    required this.svgIcon,
  }) : super(key: key);

  final String svgIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        0,
        getPropertionatesScreenWidth(20),
        getPropertionatesScreenWidth(20),
        getPropertionatesScreenWidth(20),
      ),
      child: SvgPicture.asset(
        svgIcon,
        height: getPropertionatesScreenWidth(18),
      ),
    );
  }
}

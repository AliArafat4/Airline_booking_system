import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ics324_project/components/defaultButton.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class WaitlistPaaenger extends StatelessWidget {
  WaitlistPaaenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getPropertionteScreenHeight(7),
          ),
          SizedBox(
            height: 20,
          ),
          defultButton(
              text: "Report",
              press: () {
                ReportAllFlights();
              })
        ],
      ),
    );
  }
}

Future ReportAllFlights() async {
  try {
    var url = Uri.parse("http://${ipv4}/number_of_tickets.php");
    var response = await http.get(url);
    json.decode(response.body);

    print(response.body);
  } catch (e) {
    print(e);
  }
}

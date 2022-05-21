import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/models/Product.dart';
import '../../../components/rounded_icon_btn.dart';
import '../../../size_config.dart';
import 'cart_controller.dart';

enum TicketType { Business_Class, Economic_Class, First_Class }
TicketType SelectedTicketType = TicketType.Economic_Class;

class PurchaseTickts extends StatefulWidget {
  @override
  State<PurchaseTickts> createState() => _PurchaseTicktsState();
}

late int numberOfTickets = 1;

int getNumOfTickets() {
  return numberOfTickets;
}

TicketType getTicketType() {
  return SelectedTicketType;
}

class _PurchaseTicktsState extends State<PurchaseTickts> {
  final CartController controller = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getPropertionatesScreenWidth(20)),
      child: Row(
        children: [
          Column(
            children: [
              ReusableCard(
                onPress: () {
                  setState(() {
                    SelectedTicketType = TicketType.First_Class;
                  });
                },
                colour: SelectedTicketType == TicketType.First_Class
                    ? Colors.blueGrey
                    : Colors.transparent,
                cardChild: Text(
                  'FirstClass',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  setState(() {
                    SelectedTicketType = TicketType.Economic_Class;
                  });
                },
                colour: SelectedTicketType == TicketType.Economic_Class
                    ? Colors.blueGrey
                    : Colors.transparent,
                cardChild: Text(
                  'Economic Class',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              ReusableCard(
                onPress: () {
                  setState(() {
                    SelectedTicketType = TicketType.Business_Class;
                  });
                },
                colour: SelectedTicketType == TicketType.Business_Class
                    ? Colors.blueGrey
                    : Colors.transparent,
                cardChild: Text(
                  'Business Class',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          RoundedIconsBtn(
              IconData: Icons.remove,
              press: () {
                setState(() {
                  if (numberOfTickets == 1) {
                    numberOfTickets = 1;
                  } else {
                    numberOfTickets--;
                  }
                });
              }),
          SizedBox(
            width: getPropertionatesScreenWidth(10),
          ),
          Text(
            numberOfTickets.toString(),
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(width: getPropertionatesScreenWidth(10)),
          RoundedIconsBtn(
            IconData: Icons.add,
            press: () {
              setState(() {
                if (numberOfTickets == 10) {
                  numberOfTickets = 10;
                } else {
                  numberOfTickets++;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(
      {required this.cardChild, required this.onPress, required this.colour});

  final Widget cardChild;
  final GestureTapCallback onPress;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

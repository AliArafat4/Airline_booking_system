import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ics324_project/components/custom_bottom_nav_bar.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/enums.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';
import 'package:ics324_project/screens/details/components/special_for_you.dart';
import 'package:ics324_project/screens/home/components/waitlist_screen.dart';
import 'package:ics324_project/size_config.dart';

import '../details/cart_screen.dart';
import '../profile/profile_screen.dart';
import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';

class AdminHomeScreen extends StatelessWidget {
  AdminHomeScreen({Key? key}) : super(key: key);

  static String routeName = "/admin_home";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: getPropertionteScreenHeight(60),
          title: Text("Admin Screen:           Search"),
          // backgroundColor: kAppBarColor,
          // toolbarHeight: 0,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySeach(),
                );
              },
            ),
          ],
        ),
        body: Body(),
        bottomNavigationBar: AdminBottomNavBar(
          selectedMenu: MenuState.home,
        ),
      ),
    );
  }
}

class MySeach extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            }
            query = '';
          },
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    demoProducts;
    List<Product> suggestions = demoProducts.where((searchResult) {
      final result = searchResult.title.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: demoProducts.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index].title;
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            Navigator.pushNamed(context, SpecialForYouScreen.routeName);
            // query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}

class AdminBottomNavBar extends StatelessWidget {
  const AdminBottomNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final MenuState selectedMenu;
  @override
  Widget build(BuildContext context) {
    final Color inActiveIconColor = Color(0xFFB6B6B6);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Shop Icon.svg",
                color: MenuState.home == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, AdminHomeScreen.routeName),
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Parcel.svg",
                color: MenuState.waitlist == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {
                Navigator.pushNamed(context, WaitlistScreen.routeName);
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/Chat bubble Icon.svg",
                color: MenuState.message == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/User Icon.svg",
                color: MenuState.profile == selectedMenu
                    ? kPrimaryColor
                    : inActiveIconColor,
              ),
              onPressed: () =>
                  Navigator.pushNamed(context, ProfileScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/components/custom_bottom_nav_bar.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/enums.dart';
import 'package:ics324_project/models/Product.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';
import 'package:ics324_project/screens/details/components/special_for_you.dart';
import 'package:ics324_project/size_config.dart';

import '../details/cart_screen.dart';
import 'components/body.dart';
import 'components/icon_btn_with_counter.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static String routName = "/home";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: getPropertionteScreenHeight(60),
          title: Text("Search"),
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
        bottomNavigationBar: CustomBottomNavBar(
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

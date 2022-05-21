import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ics324_project/screens/details/components/cart_controller.dart';
import 'package:ics324_project/screens/details/components/special_for_you.dart';

import '../../../constants.dart';
import '../../../models/Product.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.60,
      // height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        onChanged: (value) {
          //search value
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Flight",
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: getPropertionatesScreenWidth(20),
            vertical: getPropertionatesScreenWidth(9),
          ),
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
          title: Text(
            suggestion,
          ),
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

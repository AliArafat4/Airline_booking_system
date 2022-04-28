import 'package:flutter/material.dart';
import 'package:ics324_project/constants.dart';
import 'package:ics324_project/screens/sign_in/sign_in_screen.dart';
import 'package:ics324_project/screens/splash/components/OnboaringController.dart';
import 'package:ics324_project/size_config.dart';
import '../../../components/defaultButton.dart';
import '../components/splash_Content.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final controller = OnboardingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {
                    controller.currentPage = value;
                  });
                },
                // ignore: prefer_const_constructors
                itemCount: controller.onboardingPages.length,
                itemBuilder: (context, index) => SplachContent(
                  image: controller.onboardingPages[index].imageAsset,
                  title: controller.onboardingPages[index].title,
                  descreption: controller.onboardingPages[index].descreption,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getPropertionatesScreenWidth(20)),
                child: Column(
                  children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(controller.onboardingPages.length,
                          (index) => BuildDot(index: index)),
                    ),
                    Spacer(flex: 3),
                    defultButton(
                      text: "Continue",
                      press: () {
                        Navigator.pushNamed(context, signInScreen.routeName);
                      },
                    ),
                    Spacer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer BuildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: controller.currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color:
            controller.currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/routes/route_names.dart';
import 'intro1_view.dart';
import 'intro2_view.dart';
import 'intro3_view.dart';
import 'intro4_view.dart';

class IntroView extends StatefulWidget {
  const IntroView({super.key});

  @override
  State<IntroView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<IntroView> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  final int onboardingPages = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        actions: [
          (currentPage == onboardingPages - 1)
              ? Container()
              : TextButton(onPressed: skipMathod, child: const Text("Skip"))
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PageView(
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: const [
                IntroView1(),
                IntroView2(),
                IntroView3(),
                IntroView4(),
              ],
            ),
          ),
          Positioned(
            bottom: 50,
            child: SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  (currentPage == 0)
                      ? Container(
                          width: 60,
                        )
                      : Container(
                          width: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: IconButton(
                              onPressed: goPreviewsPage,
                              icon: Icon(
                                CupertinoIcons.arrow_left,
                                color: Theme.of(context).primaryColorLight,
                              ))),
                  OnBoardingDotWidget(
                      onboardingPages: onboardingPages,
                      currentPage: currentPage),
                  Container(
                      width: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: IconButton(
                          onPressed: continueMathod,
                          icon: Icon(
                            CupertinoIcons.arrow_right,
                            color: Theme.of(context).primaryColorLight,
                          )))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
  }

  goPreviewsPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.bounceOut);
  }

  goNextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
  }

  continueMathod() {
    goNextPage();
    if (currentPage == onboardingPages - 1) {
      log("last page");
      Navigator.pushNamedAndRemoveUntil(
          context, RouteNames.loginView, (route) => false);
    }
  }

  skipMathod() {
    // Navigator.pushNamed(context, RouteNames.createAccountView);
  }
}

class OnBoardingDotWidget extends StatelessWidget {
  const OnBoardingDotWidget({
    super.key,
    required this.onboardingPages,
    required this.currentPage,
  });

  final int onboardingPages;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List<Widget>.generate(onboardingPages, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: 10,
          width: (currentPage == index) ? 30 : 10,
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.circular(50)),
        );
      }),
    );
  }
}

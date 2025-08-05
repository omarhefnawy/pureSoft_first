import 'package:flutter/material.dart';
import 'package:fruits_task/core/utils/widgets/button.dart';
import 'package:fruits_task/view/screens/layout.dart';

import '../widgets/onBoarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    PageContent(title: "E Shopping", content: "Explore op organic fruits & grab them", imagePath: "assets/onboarding/onboard.png",),
    PageContent(title: "Delivery Arrived", content: "Order is arrived at your Place", imagePath: "assets/onboarding/onboard.png"),
    PageContent(title: "Delivery Arrived", content: "Order is arrived at your Place", imagePath: "assets/onboarding/onboard.png"),
  ];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final width= MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            children: _pages,
            controller: _pageController,
            onPageChanged: (value) {
              setState(() {
                _currentPage=value;
              });
            },
          ),
          // Button positioning
          Positioned(
            bottom: 40, // Adjusted to be closer to the bottom
            left: 20,
            right: 20,
            child: Button(
              text: _currentPage == _pages.length - 1 ? "Get Started" : "Next",
              width: width*.4, // 80% of screen width for better fit
              height: 52, // Fixed height for standard button size
              onTap: () {
                if (_currentPage < _pages.length - 1) {
                  // Move to the next page
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  // Navigate to the next screen (e.g., HomeScreen)
                  // Replace with your navigation logic
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Layout(),));
                }
              },
            ),
          ),
          Positioned(top: height*.08,right: 20,child:_currentPage < _pages.length - 1? GestureDetector(
              onTap: () {
                _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
              },
              child: Text("Skip")):SizedBox.shrink()),
        ],
      ),
    );
  }
}

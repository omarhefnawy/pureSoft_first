import 'package:flutter/material.dart';
import 'package:fruits_task/core/config/appColors.dart';
import 'package:fruits_task/view/screens/onBoarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final height= MediaQuery.of(context).size.height;
    final width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Image.asset("assets/splash/splash1.png",))),
          Align(alignment:Alignment.bottomCenter ,child: Image.asset("assets/splash/splash2.png",width: double.infinity,)),
        ],
      ),
    );
  }
}

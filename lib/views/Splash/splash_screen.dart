import 'package:credit_app/controllers/splashController.dart';
import 'package:credit_app/views/Introduction/introduction_screen.dart';
import 'package:credit_app/views/Login/register.dart';
import 'package:credit_app/widget/baseRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:win32/win32.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController customerController = Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      
      if (isLoggedIn) {
        // User is already logged in, navigate to BottomNavigationScreen
        Get.off(() => BottomNavigationScreen());
      } else {
        // User is not logged in, navigate to IntroductionScreen1
        Get.off(() => IntroductionScreen1());
      
      }
    } catch (e) {
      print('Error checking login status: $e');
      // Handle error as needed, e.g., show an error message or navigate to a default screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 120,
                backgroundColor: Colors.white.withOpacity(.30),
                child: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Image.asset('assets/kb_finance_logo.png'),
                )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                'KB Finance',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('version 1.0'),
          ],
        ),
      ),
    );
  }
}

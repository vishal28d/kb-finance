// ignore_for_file: must_be_immutable
import 'package:credit_app/views/BankerForm/banker_form_screen.dart';
import 'package:credit_app/views/Login/register.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:credit_app/controllers/introductionController.dart';
import 'package:flutter/material.dart';

//packages
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroductionScreen1 extends StatefulWidget {

  @override
  State<IntroductionScreen1> createState() => _IntroductionScreen1State();
}

class _IntroductionScreen1State extends State<IntroductionScreen1> {
  final IntroductionController introductionController = Get.put(IntroductionController());

  int? selectedPage;

  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  Future<void> _checkLoginStatus() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
      
      if (isLoggedIn) {
        // User is already logged in, navigate to BottomNavigationScreen
        Get.offAll(() => BottomNavigationScreen());
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
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: GetBuilder<IntroductionController>(builder: (controller) {
          return PageView.builder(
            itemCount: _imageUrl.length,
            controller: _pageController,
            onPageChanged: (index) {
              introductionController.setCurrentIndex(index);
            },
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 35, left: 15, right: 15),
                    width: Get.width,
                    height: MediaQuery.of(context).size.height * 0.51,
                    child: Image.asset(
                      _imageUrl[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 10, right: 20, left: 20),
                            child: Text(
                              _titles[index],
                              style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 27.0,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                            child: Text(
                              _subtitles[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          _textButtonLetStart("Customer"),
                          _textButtonLetStart2("Banker"),

                          Padding(
                            padding: EdgeInsets.only(bottom: 0),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: DotsIndicator(
                                dotsCount: _titles.length,
                                position: introductionController.currentIndex.toDouble(),
                                onTap: (i) {
                                  _pageController!.animateToPage(
                                    i.toInt(),
                                    duration: Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                decorator: DotsDecorator(
                                  activeSize: const Size(30, 10),
                                  size: const Size(17, 10),
                                  activeColor: Colors.white,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }),
      ),
    );
  }

  List<String> _titles = ['Welcome To KB Finance'];

  List<String> _subtitles = ['Join the team of Digital Financial Advisors'];

  List<String> _imageUrl = [
    'assets/intro1.jpg',
    // 'assets/intro2.jpg',
    // 'assets/intro3.jpg',
  ];

  Widget _textButtonLetStart(String? title) {
    return Container(
      
      margin: EdgeInsets.only(left: 10, right: 10),
      child: CustomShadowButton(
        text: title,
        voidCallback: () {
          // UserSession().role = UserRole.customer;
          userRole(title!) ;
          Get.to(() => RegistrationScreen());
        },
      ),
    );
  }

  Widget _textButtonLetStart2(String? title) {
    return Container(
      
      margin: EdgeInsets.only(left: 10, right: 10),
      child: CustomShadowButton(
        text: title,
        voidCallback: () {
          // UserSession().role = UserRole.banker;
          userRole(title!) ;
          Get.to(() => BankerFormScreen());
        },
      ),
    );
  }


  Future<void> userRole(String role) async {
       SharedPreferences prefs = await SharedPreferences.getInstance();
       await  prefs.setString('UserRole', role) ;
  }
}


class CustomShadowButton extends StatelessWidget {
  final String? text;
  final VoidCallback? voidCallback;
  const CustomShadowButton({Key? key, this.text, this.voidCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.only(left: 15, right: 15),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
              Theme.of(context).primaryColor ,
            ),
            foregroundColor: WidgetStateProperty.all(Colors.white),
            shape: WidgetStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            )),
            textStyle: WidgetStateProperty.all(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          onPressed: voidCallback,
          child: Text('$text')),
    );
  }
}


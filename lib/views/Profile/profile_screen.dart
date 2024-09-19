import 'package:credit_app/views/Profile/profile_entry_sreen.dart';
import 'package:credit_app/views/introduction/introduction_screen.dart';
import 'package:credit_app/widget/appBarWidget.dart';
import 'package:credit_app/widget/common_padding.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn();

  String? name;
  String? phone;
  String? email ;
  String? displayName ;

  @override
  void initState() {
    super.initState();
    getUserData(); 
  }

  Future<void> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    email = prefs.getString('email');
    displayName = prefs.getString('displayName');
    name = prefs.getString('name');
    phone = prefs.getString('phone');

    print('User Data: $email, $displayName, $name, $phone');
    setState(() {}); // Update UI after fetching user data
  }

  Future<void> _logOut() async {
    try {
      await googleSignIn.signOut();
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      Get.off(() => IntroductionScreen1()); // Navigate to introduction screen after logging out
      Get.snackbar('Signed Out', 'You have been signed out successfully', backgroundColor: Colors.blue[300]);
    } catch (e) {
      print('Error logging out: $e');
      // Handle error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: MyCustomAppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => ProfileEntryScreen(
                    // a: widget.a,
                    // o: widget.o,
                  ));
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
        height: 80,
        appbarPadding: 0,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: CommonPadding(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 12),
              child: Card(
                  child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                      margin: EdgeInsets.only(top: 0),
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 28),
                            child: CircleAvatar(
                              radius: 60,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundColor: Theme.of(context).primaryColor,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 58,
                                  child: Icon(
                                    Icons.person,
                                    size: 70,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      name ?? 'N/A',
                                      style: Theme.of(context).primaryTextTheme.headlineMedium,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Phone Number', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text(phone ?? 'N/A', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.email,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Email Id', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text(  email ?? 'N/A' , style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.idCard,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('PAN Card', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('--', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.cake,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Date of Birth', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('--', style: Theme.of(context).textTheme.bodyLarge),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.credit_card_rounded,
                            color: Theme.of(context).primaryColor,
                            size: 22,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text('Aadhar Card', style: Theme.of(context).textTheme.headlineSmall),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 05),
                        child: Text('--', style: Theme.of(context).textTheme.bodyLarge),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(),
                SizedBox(height: 15),
                ElevatedButton(
                  child: Text('Log Out'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF800000),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: _logOut, // Use _logOut method for the log out button
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

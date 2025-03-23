import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:credit_app/views/bottom_navigation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart'; // Ensure Firebase is initialized
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['profile', 'email']);
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    checkIfLoggedIn();
  }

  Future<void> initializeFirebase() async {
    try {
      // Ensure Firebase is initialized before using any Firebase services
      await Firebase.initializeApp();
    } catch (e) {
      print("Error initializing Firebase: $e");
    }
  }

  // Check if the user is already logged in
  Future<void> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isLoggedIn = prefs.getBool('isLoggedIn');

    if (isLoggedIn!) {
      // If logged in, navigate to BottomNavigationScreen
      Get.offAll(() => BottomNavigationScreen());
    }
  }

  Future<void> saveLoginStatus(User user, String userName, String phoneNumber) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save login status
    await prefs.setBool('isLoggedIn', true);

    // Save user details
    await prefs.setString('email', user.email ?? '');
    await prefs.setString('displayName', user.displayName ?? '');
    await prefs.setString('name', userName);
    await prefs.setString('phone', phoneNumber);
  }

  Future<User?> handleSignIn() async {
    try {
      // Trigger Google Sign-In
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        return null; // User canceled sign-in
      }

      final GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Firebase sign in
      UserCredential userCredential = await auth.signInWithCredential(credential);
      User? user = userCredential.user;

      if (user == null) {
        return null;
      }

      // Extract name and phone number from TextEditingController
      String userName = nameController.text.trim();
      String phoneNumber = phoneController.text.trim();

      // Store user data in Firestore
      CollectionReference collection = firestore.collection('UsersSignInData');
      await collection.doc(user.uid).set({
        'email': user.email,
        'displayName': user.displayName,
        'name': userName,
        'phone': phoneNumber,
      });

      // Save login status and user data locally
      await saveLoginStatus(user, userName, phoneNumber);

      Get.snackbar('Success', 'Login Successful as ${user.displayName}', backgroundColor: Colors.green[400]);

      // Navigate to the home screen
      Get.offAll(() => BottomNavigationScreen());

      return user;
    } catch (error) {
    // Check if the error is related to internet connectivity
    String errorMessage;

    // Example: Check if the error message contains "SocketException" for connectivity issues
    if (error.toString().contains("network_error")) {
      errorMessage = "No internet connection. Please check your connection and try again.";
    } else {
      errorMessage = "Sign In Failed: ${error.toString()}";
    }

    // Display error message using Snackbar
    Get.snackbar("Error", errorMessage, backgroundColor: Colors.red[400]);

    return null;
  }
    
  }

  void _validateAndSignIn() {
    final userName = nameController.text.trim();
    final phoneNumber = phoneController.text.trim();

    if (userName.isEmpty || phoneNumber.isEmpty) {
      // Show Snackbar if fields are empty
      Get.snackbar('Validation Error', 'Please enter both name and mobile number.',
          backgroundColor: Colors.red[400]);
    } else {
      // Proceed with sign in
      handleSignIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF800000), // Maroon color
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 170, 76, 42),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Illustration
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[200],
                    ),
                    child: Image.asset(
                      'assets/registerPageImage.png' ,
                      height: 200,
                      width: 200,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Name Field
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Enter your name',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 10),
                  // Mobile Number Field
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Enter your mobile number',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Register Button
                  ElevatedButton(
                    child: Text('Sign In With Google'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF800000), // Maroon color
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: _validateAndSignIn,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

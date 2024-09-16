// import 'package:credit_app/constants/userSession.dart';
// import 'package:credit_app/views/Home/home_screen2.dart';
// import 'package:credit_app/views/bottom_navigation_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class GoogleSignInPage extends StatefulWidget {
//   @override
//   GoogleSignInPageState createState() => GoogleSignInPageState();
// }

// class GoogleSignInPageState extends State<GoogleSignInPage> {
  
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final FirebaseFirestore firestore = FirebaseFirestore.instance;
//   bool isSigningIn = false;

//   UserRole? role;

//   Future<User?> handleSignIn() async {
//     setState(() {
//       isSigningIn = true;
//     });

//     try {
//       // Trigger the Google Sign-In process
//       final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

//       // Abort if sign in failed
//       if (googleUser == null) {
//         setState(() {
//           isSigningIn = false;
//         });
//         return null;
//       }

//       // Authenticate and get Google credentials
//       final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );

//       // Sign in to Firebase with Google credentials
//       UserCredential userCredential = await auth.signInWithCredential(credential);
//       User? user = userCredential.user;

//       // Check if user exists in the correct collection
//       CollectionReference collection;
//       String roleString = ''; // Default to empty if not found

//       // Determine user role and collection
//       bool isBanker = await checkIfUserIsBanker(user!.uid);

//       if (isBanker) {
//         collection = firestore.collection('BankersSignInData');
//         roleString = UserRole.banker.toString();
//       } else {
//         collection = firestore.collection('CustomersSignInData');
//         roleString = UserRole.customer.toString();
//       }

//       // Store user data in the appropriate collection
//       await collection.doc(user.uid).set({
//         'email': user.email,
//         'displayName': user.displayName,
//         'role': roleString,
//       });

//       // Set user role
//       UserSession().role = UserRole.values.firstWhere((e) => e.toString() == roleString);

//       setState(() {
//         isSigningIn = false;
//       });

//       // Navigate to the appropriate screen based on user role
//       Get.to(() => BottomNavigationScreen(), routeName: "Home");

//       return user;

//     } catch (error) {
//       print('Sign in failed: $error');
//       Get.snackbar("Error", "Sign In Failed");
//       setState(() {
//         isSigningIn = false;
//       });
//       return null;
//     }
//   }

//   Future<bool> checkIfUserIsBanker(String userId) async {
//     // Example method to determine if a user is a banker
//     DocumentSnapshot bankerDoc = await firestore.collection('BankersSignInData').doc(userId).get();
//     return bankerDoc.exists;
//   }

//   void handleSignOut() async {
//     await auth.signOut();
//     await googleSignIn.signOut();
//     UserSession().role = null; 
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Google Sign-In'),
//       ),
//       body: Center(
//         child: isSigningIn
//             ? CircularProgressIndicator()
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton.icon(
//                     icon: Icon(Icons.login),
//                     label: Text('Sign in with Google'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.blue, // Google blue
//                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     ),
//                     onPressed: () async {
//                       User? user = await handleSignIn();
//                       if (user != null) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Signed in as ${user.displayName ?? 'User'}'),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                   SizedBox(height: 20),
//                   ElevatedButton.icon(
//                     icon: Icon(Icons.logout),
//                     label: Text('Sign out'),
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.red, // Red for Sign out
//                       padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//                     ),
//                     onPressed: handleSignOut,
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

//   import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:houserental/utils/shared_prefs.dart';


// Future<bool> userLogin(BuildContext context, String email,password) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//          await SHP.saveEmailSP(email); 
//          await SHP.saveUserLoggedinStatusSP(true);
//       return true;
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print("No User Found for that Email");
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "No User Found for that Email",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       } else if (e.code == 'wrong-password') {
//         print("Wrong Password Provided by User");
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.orangeAccent,
//             content: Text(
//               "Wrong Password Provided by User",
//               style: TextStyle(fontSize: 18.0, color: Colors.black),
//             ),
//           ),
//         );
//       }
//       return false;
//     }
//   }
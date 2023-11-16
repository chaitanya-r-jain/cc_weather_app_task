// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// // class AuthService {
// //   SignInWithGoogle() async {
// //     final GoogleSignInAccount gUser = GoogleSignIn().signIn();

// //     final GoogleSignInAuthentication gAuth = await gUser!.authentication;

// //     final Credential = GoogleAuthProvider.credential(
// //       accessToken: gAuth.accessToken,
// //       idToken: gAuth.idToken,
// //     );

// //     return await FirebaseAuth.instance.signInWithCredential(Credential);
// //   }
// // }

// class GoogleSignIn extends StatelessWidget {
//   const GoogleSignIn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/home_background.png'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Coding Club Weather App',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                     fontSize: 50,
//                     fontWeight: FontWeight.w900,
//                     color: Color.fromARGB(158, 10, 10, 10)),
//               ),
//               const SizedBox(
//                 height: 30,
//               ),
//               CupertinoButton(
//                 onPressed: () {},
//                 // onPressed: AuthService().SignInWithGoogle(),
//                 child: const CircleAvatar(
//                   radius: 30,
//                   backgroundImage: AssetImage('assets/images/googlelogo.png'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';

// class SignInOptionsScreen extends StatelessWidget {
//   const SignInOptionsScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: AlignmentDirectional.topCenter,
//       clipBehavior: Clip.none,
//       children: [
//         Positioned(
//           top: -15,
//           child: Container(
//             width: 60,
//             height: 7,
//             margin: const EdgeInsets.only(bottom: 20),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(5),
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             child: Column(
//               children: [
//                 TextFormField(
//                   decoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: "title",
//                   ),
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: const Text("Add note"),
//                   style: ElevatedButton.styleFrom(
//                       elevation: 5,
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       minimumSize: Size(double.infinity, 50)),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 OutlinedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: const Text("CANCEL"),
//                   style: OutlinedButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0)),
//                       minimumSize: Size(double.infinity, 50)),
//                 )
//               ],
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

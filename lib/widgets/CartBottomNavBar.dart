// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/widgets/payment_method.dart';
//
// class CartBottomNavBar extends StatelessWidget {
//   const CartBottomNavBar({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20),
//         height: 70,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             // Total amount section
//             const Row(
//               children: [
//                 Text(
//                   "Total :",
//                   style: TextStyle(
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   width: 15,
//                 ),
//                 Text(
//                   "₹400",
//                   style: TextStyle(
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                   ),
//                 ),
//               ],
//             ),
//             // Order button with navigation
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const PaymentMethod(),
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 20,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//               ),
//               child: const Text(
//                 "Order Now",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

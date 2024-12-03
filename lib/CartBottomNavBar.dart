// import 'package:flutter/material.dart';
// import 'package:food_delivery_app/widgets/payment_method.dart';
//
// class CartBottomNavBar extends StatelessWidget {
//   final int totalAmount;
//
//   // Accept the total price as a parameter
//   const CartBottomNavBar({super.key, required this.totalAmount});
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           height: 70,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               // Total amount section
//               Row(
//                 children: [
//                   const Text(
//                     "Total :",
//                     style: TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 15,
//                   ),
//                   Text(
//                     "₹$totalAmount", // Use the dynamic totalAmount value
//                     style: const TextStyle(
//                       fontSize: 19,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ],
//               ),
//               // Order button
//               ElevatedButton(
//                 onPressed: () {
//                   // Your order logic here
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   padding: const EdgeInsets.symmetric(
//                     vertical: 15,
//                     horizontal: 20,
//                   ),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//                 child: const Text(
//                   "Order Now",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // SizedBox(height :20 ),
//           // InkWell(
//           //   onTap: () {
//           //     Navigator.push(context, MaterialPageRoute(builder: (context) => paymentMethod(),
//           //     ));
//           //   },
//           // )
//       ),
//     );
//   }
// }
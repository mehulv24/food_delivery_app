import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'No past orders yet',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}

void main() => runApp(const MaterialApp(
  home: OrderScreen(),
));

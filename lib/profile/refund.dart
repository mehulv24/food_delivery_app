import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Refund Status',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: RefundStatusScreen(),
  ));
}

class RefundStatusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Refund Status'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: const Center(
        child: Text(
          'No refund yet.',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    ); // Close the Scaffold widget here
  }
}

import 'package:flutter/material.dart';

class SubscribeAndSavePage extends StatefulWidget {
  @override
  _SubscribeAndSavePageState createState() => _SubscribeAndSavePageState();
}

class _SubscribeAndSavePageState extends State<SubscribeAndSavePage> {
  final double _discount = 0.15;  // Fixed discount rate for subscription
  bool _isSubscribed = false;

  void _toggleSubscription() {
    setState(() {
      _isSubscribed = !_isSubscribed;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isSubscribed
              ? "Subscribed! You’ll receive a ${(_discount * 100).toInt()}% discount on every order."
              : "Subscription canceled.",
        ),
        backgroundColor: _isSubscribed ? Colors.blue : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Subscribe & Save'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text(
          'No Subscribe & Save item yet.',
          style: TextStyle(fontSize: 20, color: Colors.grey),
        ),
      ),
    );
  }
}

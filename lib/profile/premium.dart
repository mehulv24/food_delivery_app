import 'package:flutter/material.dart';

class PremiumScreen extends StatefulWidget {
  @override
  _PremiumScreenState createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  bool _isSubscribed = false;

  void _toggleSubscription() {
    setState(() {
      _isSubscribed = !_isSubscribed;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _isSubscribed ? "You have subscribed to Premium!" : "Subscription cancelled.",
        ),
        backgroundColor: _isSubscribed ? Colors.green : Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Premium Membership"),
        backgroundColor: Colors.blue,  // Blue theme for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Premium Membership",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
            SizedBox(height: 20),
            Text(
              "Get exclusive benefits with Premium Membership:",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.local_shipping, color: Colors.blue),
                title: Text("Free Delivery on All Orders"),
                subtitle: Text("Enjoy unlimited free delivery on all your orders!"),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.discount, color: Colors.blue),
                title: Text("Exclusive Discounts & Offers"),
                subtitle: Text("Get access to exclusive discounts on select restaurants."),
              ),
            ),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: Icon(Icons.star, color: Colors.blue),
                title: Text("Priority Customer Support"),
                subtitle: Text("Receive priority support for any issues or concerns."),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleSubscription,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              child: Text(_isSubscribed ? "Cancel Subscription" : "Subscribe Now"),
            ),
            SizedBox(height: 20),
            // Conditional message for subscription status
            if (_isSubscribed)
              Text(
                "You are a Premium member! Enjoy your benefits.",
                style: TextStyle(fontSize: 16, color: Colors.green),
              )
            else
              Text(
                "Get access to premium benefits by subscribing.",
                style: TextStyle(fontSize: 16, color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}

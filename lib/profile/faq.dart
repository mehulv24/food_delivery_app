import 'package:flutter/material.dart';

class FAQPage extends StatelessWidget {
  final List<Map<String, String>> faqList = [
    {
      "question": "How do I place an order?",
      "answer":
      "To place an order, browse through the food items, add your choices to the cart, and proceed to checkout. You can track your order in real-time after placing it."
    },
    {
      "question": "What payment methods are accepted?",
      "answer":
      "We accept various payment options including credit/debit cards, net banking, and popular UPI methods. You can select your preferred payment option during checkout."
    },
    {
      "question": "Can I cancel my order?",
      "answer":
      "Yes, you can cancel your order within a few minutes after placing it. Go to 'Track Order' and select 'Cancel Order' to stop it. Note: cancellation policies may vary depending on the restaurant."
    },
    {
      "question": "How do I apply a discount code?",
      "answer":
      "You can apply discount codes during checkout. Enter the code in the designated area, and if valid, the discount will be applied to your total."
    },
    {
      "question": "What is 'Eat with Friends'?",
      "answer":
      "'Eat with Friends' is a feature that lets you share your order with friends or family, enabling you to enjoy meals together even when ordering separately."
    },
    {
      "question": "How can I track my order?",
      "answer":
      "Once your order is confirmed, you can view the live status of your order under 'Track Order'. Updates will show you when it is being prepared, picked up, and delivered."
    },
    {
      "question": "What if I have an issue with my order?",
      "answer":
      "If there’s an issue, reach out to our support team through the 'Help Desk' feature. They can assist you with refunds, replacements, or any other concerns."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frequently Asked Questions"),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            title: Text(faqList[index]["question"]!),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(faqList[index]["answer"]!),
              ),
            ],
          );
        },
      ),
    );
  }
}

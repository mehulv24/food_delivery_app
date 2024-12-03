import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _feedbackController = TextEditingController();
  String? _selectedRating;

  final List<String> _ratingOptions = ["Poor", "Average", "Good", "Very Good", "Excellent"];

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      String feedbackText = _feedbackController.text;
      String rating = _selectedRating ?? "No rating selected";

      // Here you would send feedback to your server or Firebase
      // For example:
      // FeedbackService.sendFeedback(feedbackText, rating);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Thank you for your feedback!")),
      );

      // Clear the form after submission
      _feedbackController.clear();
      setState(() {
        _selectedRating = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Feedback"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How was your experience?",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _selectedRating,
                items: _ratingOptions.map((String rating) {
                  return DropdownMenuItem<String>(
                    value: rating,
                    child: Text(rating),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _selectedRating = newValue;
                  });
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Select Rating",
                ),
                validator: (value) {
                  if (value == null) {
                    return "Please select a rating";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Text(
                "Your Feedback",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: "Tell us about your experience...",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your feedback";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _submitFeedback,
                  child: Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

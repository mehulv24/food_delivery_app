import 'package:flutter/material.dart';
import '/widgets/payment_method.dart';

class EatWithFriendsPage extends StatefulWidget {
  @override
  _EatWithFriendsPageState createState() => _EatWithFriendsPageState();
}

class _EatWithFriendsPageState extends State<EatWithFriendsPage> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _addressControllers = [];

  void _addAddressField() {
    setState(() {
      _addressControllers.add(TextEditingController());
    });
  }

  void _removeAddressField(int index) {
    setState(() {
      _addressControllers[index].dispose();
      _addressControllers.removeAt(index);
    });
  }

  void _placeOrder() {
    if (_formKey.currentState!.validate()) {
      List<String> addresses = _addressControllers.map((controller) => controller.text).toList();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Order placed to all addresses!"),
          backgroundColor: Colors.blue,  // Blue background for feedback
        ),
      );

      // Clear all address fields after placing the order
      for (var controller in _addressControllers) {
        controller.clear();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _addressControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Eat with Friends"),
        backgroundColor: Colors.blue,  // Blue app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                "Add delivery addresses for your friends/family:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),  // Blue title
              ),
              SizedBox(height: 20),
              ..._addressControllers.asMap().entries.map((entry) {
                int index = entry.key;
                TextEditingController controller = entry.value;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: controller,
                          decoration: InputDecoration(
                            labelText: "Address ${index + 1}",
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),  // Blue border when focused
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter an address";
                            }
                            return null;
                          },
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () => _removeAddressField(index),
                      ),
                    ],
                  ),
                );
              }).toList(),
              SizedBox(height: 10),
              TextButton.icon(
                icon: Icon(Icons.add, color: Colors.blue),  // Blue icon for add address
                label: Text("Add Another Address", style: TextStyle(color: Colors.blue)),
                onPressed: _addAddressField,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue), // Blue button
                onPressed: () {
                  Navigator.pushNamed(context, '/payment_method'); // Replace 'register' with your desired named route
                },
                child: Text("Place Order to All Addresses"),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

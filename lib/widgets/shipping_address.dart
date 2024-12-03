import 'package:flutter/material.dart';
import 'Payment_confirm.dart'; // Ensure this file exists and is properly implemented.
class ShippingAddress extends StatelessWidget {
  ShippingAddress({Key? key, required int totalitems, required double subTotal}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _pinCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Shipping Address"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Full Name",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _mobileController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Mobile Number",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your mobile number';
                    //   }
                    //   if (!RegExp(r'^\d{10}\$').hasMatch(value)) {
                    //     return 'Please enter a valid 10-digit mobile number';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Address",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _streetController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Street",
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your street';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _pinCodeController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Pin Code",
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your pin code';
                    //   }
                    //   if (!RegExp(r'^\d{6}\$').hasMatch(value)) {
                    //     return 'Please enter a valid 6-digit pin code';
                    //   }
                    //   return null;
                    // },
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(context,MaterialPageRoute(builder: (context)=>PaymentMethod()));
                        // Navigator.pop(
                        //   context,
                        //   {
                        //     "name": _nameController.text,
                        //     "mobile": _mobileController.text,
                        //     "address": _addressController.text,
                        //     "street": _streetController.text,
                        //     "pinCode": _pinCodeController.text,
                        //   },
                        // );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: const Text(
                        "Confirm Address",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

class AddressScreen extends StatefulWidget {
  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  // List of saved addresses
  List<Map<String, String>> savedAddresses = [
    {
      'type': 'Home',
      'address': 'Ganesh nagar kesari khera crossing, Krishna Nagar, Alaknanda'
    },
  ];

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  bool _isEditing = false;
  int _editingIndex = -1;

  // Function to add a new address
  void _addNewAddress() {
    if (_addressController.text.isNotEmpty && _typeController.text.isNotEmpty) {
      setState(() {
        savedAddresses.add({
          'type': _typeController.text,
          'address': _addressController.text,
        });
      });
      _clearForm();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Address added successfully!')),
      );
    }
  }

  // Function to edit an existing address
  void _editAddress(int index) {
    setState(() {
      _isEditing = true;
      _editingIndex = index;
      _typeController.text = savedAddresses[index]['type']!;
      _addressController.text = savedAddresses[index]['address']!;
    });
  }

  // Function to save the edited address
  void _saveEditedAddress() {
    if (_addressController.text.isNotEmpty && _typeController.text.isNotEmpty) {
      setState(() {
        savedAddresses[_editingIndex] = {
          'type': _typeController.text,
          'address': _addressController.text,
        };
      });
      _clearForm();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Address updated successfully!')),
      );
    }
  }

  // Function to delete an address
  void _deleteAddress(int index) {
    setState(() {
      savedAddresses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Address deleted!')),
    );
  }

  // Function to clear the form
  void _clearForm() {
    _typeController.clear();
    _addressController.clear();
    _isEditing = false;
    _editingIndex = -1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Addresses'),
        backgroundColor: Colors.blue, // AppBar color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add Address Form
            TextField(
              controller: _typeController,
              decoration: InputDecoration(
                labelText: 'Address Type (e.g. Home)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isEditing ? _saveEditedAddress : _addNewAddress,
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Text(_isEditing ? 'Save Address' : 'Add Address'),
            ),
            SizedBox(height: 20),

            // Saved Addresses Title
            Text(
              'Saved Addresses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),

            // Displaying saved addresses
            Expanded(
              child: ListView.builder(
                itemCount: savedAddresses.length,
                itemBuilder: (context, index) {
                  final address = savedAddresses[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    elevation: 4,
                    child: ListTile(
                      leading: Icon(Icons.home, color: Colors.blue),
                      title: Text(address['type']!),
                      subtitle: Text(address['address']!),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Edit Button
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.orange),
                            onPressed: () => _editAddress(index),
                          ),
                          // Delete Button
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => _deleteAddress(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

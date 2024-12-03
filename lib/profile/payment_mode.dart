import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payments Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PaymentsScreen(),
    );
  }
}

class PaymentsScreen extends StatefulWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  _PaymentsScreenState createState() => _PaymentsScreenState();
}

class _PaymentsScreenState extends State<PaymentsScreen> {
  final List<String> _upiAddresses = []; // List to store UPI addresses
  final TextEditingController _upiController = TextEditingController();

  // Add a new UPI address
  void _addUPIAddress(String upi) {
    if (upi.isNotEmpty) {
      setState(() {
        _upiAddresses.add(upi);
      });
      _upiController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('UPI Address added successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid UPI address!')),
      );
    }
  }

  // Delete a UPI address
  void _deleteUPIAddress(int index) {
    setState(() {
      _upiAddresses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('UPI Address deleted!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PAYMENTS'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'UPI ADDRESSES',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Column(
                children: _upiAddresses.asMap().entries.map((entry) {
                  int index = entry.key;
                  String upi = entry.value;
                  return ListTile(
                    leading: const Icon(Icons.account_balance_wallet),
                    title: Text(upi),
                    trailing: TextButton(
                      onPressed: () => _deleteUPIAddress(index),
                      child: const Text(
                        'DELETE',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ),
                  );
                }).toList(),
              ),
              ListTile(
                leading: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.orange,
                ),
                title: const Text(
                  'ADD NEW UPI ADDRESS',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _showAddUPIDialog(context);
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'SAVED CARDS',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(
                  Icons.add_box_rounded,
                  color: Colors.orange,
                ),
                title: const Text(
                  'ADD NEW CARD',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddNewCardScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              const Text(
                'WALLET',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10),
              PaymentOptionTile(
                title: 'Phonepe',
                trailingText: 'LINK ACCOUNT',
                icon: Icons.account_balance_wallet,
              ),
              PaymentOptionTile(
                title: 'Amazon Pay',
                trailingText: 'LINK ACCOUNT',
                icon: Icons.account_balance_wallet,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAddUPIDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add UPI Address'),
          content: TextField(
            controller: _upiController,
            decoration: const InputDecoration(
              labelText: 'Enter UPI Address',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _addUPIAddress(_upiController.text.trim());
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final String title;
  final String trailingText;
  final IconData icon;

  const PaymentOptionTile({
    Key? key,
    required this.title,
    required this.trailingText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Text(
        trailingText,
        style: const TextStyle(color: Colors.orange),
      ),
      onTap: () {
        // Action for the list tile
      },
    );
  }
}

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({Key? key}) : super(key: key);

  @override
  _AddNewCardScreenState createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _validThroughController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(
                labelText: 'Card Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _validThroughController,
              decoration: const InputDecoration(
                labelText: 'Valid Through (MM/YY)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.datetime,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cvvController,
              decoration: const InputDecoration(
                labelText: 'CVV',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              obscureText: true,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _nameOnCardController,
              decoration: const InputDecoration(
                labelText: 'Name on Card',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Save card details logic here
                  String cardNumber = _cardNumberController.text;
                  String validThrough = _validThroughController.text;
                  String cvv = _cvvController.text;
                  String nameOnCard = _nameOnCardController.text;

                  if (cardNumber.isNotEmpty &&
                      validThrough.isNotEmpty &&
                      cvv.isNotEmpty &&
                      nameOnCard.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Card details saved successfully!'),
                      ),
                    );
                    Navigator.pop(context);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields!'),
                      ),
                    );
                  }
                },
                child: const Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';


import 'order_success_screen.dart';

class CartItem {
  final double price;
  final int quantity;

  CartItem({required this.price, required this.quantity});
}

class Cart {
  List<CartItem> items;

  Cart({this.items = const []});

  double calculateSubTotal() {
    return items.fold(0, (total, item) => total + item.price * item.quantity);
  }
}

class PaymentMethod extends StatefulWidget {
  const PaymentMethod({super.key});

  @override
  State<PaymentMethod> createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  int _selectedPaymentMethod = 1;
  double subTotal = 0;
  double deliveryCharge = 60;

  late Cart cart; // Declare cart as a non-nullable Cart instance

  @override
  void initState() {
    super.initState();
    _loadCartValues();
  }

  void _loadCartValues() {
    // Initialize the cart here (replace with your actual cart data)
    cart = Cart(items: [
      CartItem(price: 100.0, quantity: 2), // Example cart items
      CartItem(price: 50.0, quantity: 1),
    ]);

    // Now calculate the subtotal
    subTotal = cart.calculateSubTotal();
    setState(() {});
  }

  void _handleRadioSelection(Object? value) {
    setState(() {
      _selectedPaymentMethod = value as int;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              _buildPaymentOption(
                size: size,
                value: 1,
                title: "Amazon Pay",
                imagePath: "assets/image4.png",
                imageWidth: 70,
                imageHeight: 70,
              ),
              const SizedBox(height: 15),
              _buildCreditCardOption(size),
              const SizedBox(height: 15),
              _buildPaymentOption(
                size: size,
                value: 3,
                title: "PayPal",
                imagePath: "assets/payp.png",
                imageWidth: 70,
                imageHeight: 70,
              ),
              const SizedBox(height: 15),
              _buildPaymentOption(
                size: size,
                value: 4,
                title: "Google Pay",
                imagePath: "assets/icon2.png",
                imageWidth: 50,
                imageHeight: 50,
              ),
              const SizedBox(height: 100),
              _buildPricingDetails(),
              const SizedBox(height: 70),
              _buildConfirmPaymentButton(context, size),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("Payment Method"),
      leading: const BackButton(color: Colors.black),
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      centerTitle: true,
    );
  }

  Widget _buildPaymentOption({
    required Size size,
    required int value,
    required String title,
    required String imagePath,
    required double imageWidth,
    required double imageHeight,
  }) {
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: _selectedPaymentMethod == value ? 1 : 0.3,
          color: _selectedPaymentMethod == value ? Colors.black : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Radio(
                    value: value,
                    groupValue: _selectedPaymentMethod,
                    onChanged: _handleRadioSelection,
                    activeColor: Colors.blue,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: _selectedPaymentMethod == value
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              Image.asset(
                imagePath,
                width: imageWidth,
                height: imageHeight,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCreditCardOption(Size size) {
    return Container(
      width: size.width,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(
          width: _selectedPaymentMethod == 2 ? 1 : 0.3,
          color: _selectedPaymentMethod == 2 ? Colors.black : Colors.grey,
        ),
        borderRadius: BorderRadius.circular(5),
        color: Colors.transparent,
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Radio(
                    value: 2,
                    groupValue: _selectedPaymentMethod,
                    onChanged: _handleRadioSelection,
                    activeColor: Colors.blue,
                  ),
                  Text(
                    "Credit Card",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: _selectedPaymentMethod == 2
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                "assets/visa.jpg",
                width: 35,
                fit: BoxFit.cover,
              ),
              const SizedBox(width: 8),
              Image.asset(
                "assets/mastercard.png",
                width: 35,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPricingDetails() {
    double total = subTotal + deliveryCharge;
    return Column(
      children: [
        _buildPriceRow("Sub-Total", "₹${subTotal.toStringAsFixed(2)}"),
        const SizedBox(height: 10),
        _buildPriceRow("Delivery Charge", "₹${deliveryCharge.toStringAsFixed(2)}"),
        const Divider(height: 30, color: Colors.black),
        _buildPriceRow(
          "Total",
          "₹${total.toStringAsFixed(2)}",
          titleStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String title, String price, {TextStyle? titleStyle}) {
    const defaultStyle = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      color: Colors.grey,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: titleStyle ?? defaultStyle,
        ),
        Text(
          price,
          style: defaultStyle,
        ),
      ],
    );
  }

  Widget _buildConfirmPaymentButton(BuildContext context, Size size) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderSuccessScreen(),
          ),
        );
      },
      child: Container(
        width: size.width,
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Center(
          child: Text(
            "Confirm Payment",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import '../widgets/big_text.dart';

class RestaurantMenu extends StatefulWidget {
  const RestaurantMenu({super.key});

  @override
  RestaurantMenuState createState() => RestaurantMenuState();
}

class RestaurantMenuState extends State<RestaurantMenu> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> pizzaItems = [
    {
      'name': 'Cheesy Pizza',
      'description':
      'An indulgent pizza loaded with rich, melted cheese for the ultimate comfort food experience.',
      'price': 109,
    },
    {
      'name': 'Capsicum Paneer Pizza',
      'description':
      'A delicious fusion of soft paneer, crunchy capsicum, and rich cheese on a crispy crust.',
      'price': 129,
    },
    {
      'name': 'Tomato Corn Pizza',
      'description':
      'A delightful blend of juicy tomatoes and sweet corn on a crispy crust.',
      'price': 149,
    },
    {
      'name': 'Onion Capsicum Pizza',
      'description':
      'A flavorful combo of crunchy capsicum and caramelized onions on a cheesy base.',
      'price': 109,
    },
  ];

  final List<Map<String, dynamic>> burgerItems = [
    {
      'name': 'Veggie Delight Burger',
      'description':
      'A hearty patty made from fresh vegetables, served with lettuce, tomato, and a zesty mayo.',
      'price': 59,
    },
    {
      'name': 'Paneer Tikka Burger',
      'description':
      'Grilled paneer cubes marinated in Indian spices, topped with onions and mint chutney.',
      'price': 79,
    },
    {
      'name': 'Spicy Bean Burger',
      'description':
      'A spicy bean patty packed with protein, layered with jalapeños, and tangy salsa.',
      'price': 79,
    },
    {
      'name': 'Mushroom and Cheese Burger',
      'description':
      'Grilled mushrooms and melted cheese combined with lettuce and a creamy garlic sauce.',
      'price': 99,
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;


    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        // ... (your existing BottomNavigationBar code)
        elevation: 15,
        iconSize: 28,
        selectedLabelStyle:
        const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        unselectedLabelStyle:
        const TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        unselectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index; // Update the current index based on the tapped item
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined), // Icon for Home
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined), // Icon for Cart
            label: "Cart",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), // Icon for Profile
            label: "Profile",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy), // Icon for Chatbot
            label: "Chatbot",
            backgroundColor: Colors.black,
          ),

        ],
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: BigText(data: "Western Pizza Hub", screenWidth: screenWidth),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // double screenHeight = constraints.maxHeight;
          // double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(
                      data: "Pizzas, Italian, Burgers",
                      screenWidth: screenWidth),
                  SmallText(
                      data: "Gandhinagar, Gujarat", screenWidth: screenWidth),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("⭐ 4.4 (100)", style: TextStyle(fontSize: 16)),
                      Row(
                        children: [
                          Icon(Icons.delivery_dining, color: Colors.brown),
                          Text(" 60-65 mins", style: TextStyle(fontSize: 16)),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.more_rounded, color: Colors.indigoAccent),
                          Text(" Rs 200 For Two",
                              style: TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    color: Colors.black12,
                    child: Column(
                      children: [
                        ListTile(
                          leading:
                          const Icon(Icons.local_offer, color: Colors.red),
                          title: SmallText(
                              data:
                              "30% off up to Rs 75 | Use code CRAVETOSAVE",
                              screenWidth: screenWidth),
                        ),
                        ListTile(
                          leading:
                          const Icon(Icons.local_offer, color: Colors.red),
                          title: SmallText(
                              data:
                              "20% off up to Rs 100 with SBI credit cards, once per week | Use code 100SBI",
                              screenWidth: screenWidth),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Icon(Icons.verified, color: Colors.green),
                      Text(
                        " PURE VEG",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1),
                  const SizedBox(height: 5),
                  const Text(
                    "RECOMMENDED",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItem(
                        imageUrl: 'assets/images/cheesy-pizza.jpg',
                        name: ' Cheesy Pizza',
                        price: 'Rs 109',
                      ),
                      MenuItem(
                        imageUrl: 'assets/images/capsicum-paneer-pizza.jpg',
                        name: ' Capsicum Paneer Pizza',
                        price: 'Rs 129',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MenuItem(
                        imageUrl: 'assets/images/tomato-golden-corn-pizza.jpg',
                        name: ' Tomato Corn Pizza',
                        price: 'Rs 149',
                      ),
                      MenuItem(
                        imageUrl: 'assets/images/onion-capsicum-pizza.jpg',
                        name: ' Onion Capsicum Pizza',
                        price: 'Rs 109',
                      ),
                    ],
                  ),

                  // Pizza section
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pizza section title
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Pizza',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(thickness: 1),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // List should not scroll independently
                          shrinkWrap: true,
                          // Wraps content to the available height
                          itemCount: pizzaItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 1.0),
                              child: ListTile(
                                leading: const Icon(Icons.restaurant,
                                    color: Colors.lightBlueAccent),
                                title: Text(
                                  pizzaItems[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle:
                                pizzaItems[index]['description'] != null
                                    ? Text(
                                  pizzaItems[index]['description'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey),
                                )
                                    : null,
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rs ${pizzaItems[index]['price']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 80,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, 'cart');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              209, 233, 246, 1.0),
                                          // rgb(209, 233, 246)
                                          foregroundColor:
                                          Colors.lightBlueAccent,
                                        ),
                                        child: const Text('ADD'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  // Burger Section
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Pizza section title
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          child: Text(
                            'Burgers',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Divider(thickness: 1),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          // List should not scroll independently
                          shrinkWrap: true,
                          // Wraps content to the available height
                          itemCount: burgerItems.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 1.0),
                              child: ListTile(
                                leading: const Icon(Icons.restaurant,
                                    color: Colors.lightBlueAccent),
                                title: Text(
                                  burgerItems[index]['name'],
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                subtitle:
                                burgerItems[index]['description'] != null
                                    ? Text(
                                  burgerItems[index]['description'],
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey),
                                )
                                    : null,
                                trailing: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Rs ${burgerItems[index]['price']}',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 80,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, 'cart');
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              209, 233, 246, 1.0),
                                          // rgb(209, 233, 246)
                                          foregroundColor:
                                          Colors.lightBlueAccent,
                                        ),
                                        child: const Text('ADD'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;

  const MenuItem({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          height: 170,
          width: 170,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 15),
            Text(
              name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(price),
            const SizedBox(width: 40),
            ElevatedButton(
              onPressed: () {Navigator.pushNamed(context, 'cart');},
              child: const Text('ADD'),
            ),
          ],
        ),
      ],
    );
  }
}




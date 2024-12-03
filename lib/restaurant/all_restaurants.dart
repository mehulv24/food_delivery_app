import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
// import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:food_delivery_app/restaurant/restaurant_menu.dart';


class RestaurantScreen extends StatefulWidget {
  final String foodItem;

  const RestaurantScreen({super.key, required this.foodItem});

  @override
  RestaurantScreenState createState() => RestaurantScreenState();
}

class RestaurantScreenState extends State<RestaurantScreen> {
  int _currentPage = 0;
  int currentIndex = 0;

  final List<Map<String, dynamic>> _offers = [
    {
      'title': ' FLAT 200/- OFF ',
      'restaurant': 'Sweet Truth',
      'rating': 4.9,
      'deliveryTime': '45 mins',
      'image': 'assets/images/offer-1.jpg'
    },
    {
      'title': ' ITEMS @99 ',
      'restaurant': 'Burger Farm',
      'rating': 4.7,
      'deliveryTime': '25-30 mins',
      'image': 'assets/images/offer-2.jpg'
    },
    {
      'title': ' FLAT 100/- OFF ',
      'restaurant': "Starbucks",
      'rating': 4.4,
      'deliveryTime': '30-35 mins',
      'image': 'assets/images/offer-3.jpg'
    },
  ];

  final List<Map<String, dynamic>> _restaurants = [
    {
      'name': 'Western Pizza Hub',
      'rating': 4.4,
      'deliveryTime': '60-65 mins',
      'description': 'Pizzas, Italian, Burgers',
      'city': 'Gandhinagar',
      'distance': '13.7 km',
      'image': 'assets/images/pizza-1.jpg'
    },
    {
      'name': "Drizzle's Pizza",
      'rating': 4.5,
      'deliveryTime': '40 mins',
      'description': 'Pizzas, Pastas, Fast Food',
      'city': 'Radhe Square',
      'distance': '10.1 km',
      'image': 'assets/images/pizza-2.jpg'
    },
    {
      'name': 'Pizza Hut',
      'rating': 4.2,
      'deliveryTime': '35-40 mins',
      'description': 'Pizzas',
      'city': 'Gandhinagar',
      'distance': '9.8 km',
      'image': 'assets/images/pizza-3.jpg'
    },
    {
      'name': "La Pino'z Pizza",
      'rating': 4.3,
      'deliveryTime': '35-40 mins',
      'description': 'Pizzas, Pastas, Italian, Desserts',
      'city': 'Gandhinagar',
      'distance': '9.5 km',
      'image': 'assets/images/pizza-4.jpg'
    },
  ];

  @override
  Widget build(BuildContext context) {
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenHeight = constraints.maxHeight;
          double screenWidth = constraints.maxWidth;

          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Search for dishes & restaurants",
                      ),
                    ),
                  ],
                ),
                Container(
                  height: screenHeight * 0.1,
                  margin: const EdgeInsets.only(left: 8.0, right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.bottomCenter,
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        // borderSide: BorderSide.none,
                      ),
                      hintText: "${widget.foodItem} ",
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.close_rounded),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.05,
                      vertical: screenHeight * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "All Restaurants",
                        style: TextStyle(
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Text(
                              "Sort By",
                              style: TextStyle(fontSize: screenWidth * 0.04),
                            ),
                            icon: const Icon(Icons.arrow_drop_down),
                            items: <String>[
                              'Relevance',
                              'Rating',
                              'Delivery Time',
                              'Price (Low to High)',
                              'Price (High to Low)'
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.035)),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              // Handle sort action
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // PAGE VIEW BUILDER
                SizedBox(
                  height: screenHeight * 0.3,
                  child: PageView.builder(
                    itemCount: _offers.length,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      var offer = _offers[index];
                      return Padding(
                        padding: EdgeInsets.all(screenWidth * 0.03),
                        child: Card(
                          color: Colors.lightBlueAccent, //rgb()rgb()
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(screenWidth * 0.03)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(screenWidth * 0.03),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color.fromRGBO(0, 31, 63, 1.0),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: BigText(
                                    data: offer['title'],
                                    screenWidth: screenWidth,
                                    textColor: Colors.white,
                                  ),
                                ),
                              ),

                              // TEXT OF PAGE VIEW BUILDER
                              Expanded(
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.all(screenWidth * 0.03),
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.end,
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(offer['restaurant'],
                                                style: const TextStyle(
                                                    color: Color.fromRGBO(
                                                        0, 31, 63, 1.0),
                                                    fontSize: 20)),
                                            SizedBox(
                                                height: screenHeight * 0.01),
                                            Row(
                                              children: [
                                                const Text('⭐ '),
                                                // Icon(Icons.star,
                                                //     color: const Color.fromRGBO(0, 31, 63, 1.0),
                                                //     size: screenWidth * 0.045),
                                                Text('${offer['rating']}'),
                                                SizedBox(
                                                    width: screenWidth * 0.02),
                                                Text(offer['deliveryTime']),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    // IMAGE OF PAGE VIEW BUILDER
                                    Expanded(
                                      flex: 2,
                                      child: Padding(
                                        padding:
                                        EdgeInsets.all(screenWidth * 0.03),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              screenWidth * 0.03),
                                          child: Image.asset(offer['image'],
                                              fit: BoxFit.cover,
                                              height: screenHeight * 0.3),
                                        ),
                                      ),
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
                ),

                // PAGE CONSTRUCTOR (USING LIST OF CIRCLES)
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(_offers.length, (index) {
                      return Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01),
                        width: _currentPage == index
                            ? screenWidth * 0.04
                            : screenWidth * 0.02,
                        height: screenHeight * 0.01,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentPage == index
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ),

                // LIST OF RESTAURANTS
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _restaurants.length,
                  itemBuilder: (context, index) {
                    var restaurant = _restaurants[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.05,
                          vertical: screenHeight * 0.02),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RestaurantMenu(), // Navigate to RestaurantMenu
                            ),
                          );
                        },
                        child: Card(
                          color: const Color.fromRGBO(
                              209, 233, 246, 1.0), //rgb(238, 202, 213)
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.02),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.03),
                                    child: Image.asset(restaurant['image'],
                                        fit: BoxFit.cover,
                                        height: screenHeight * 0.15),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(screenWidth * 0.03),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        restaurant['name'],
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.05,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: const Color.fromRGBO(
                                                  100, 32, 170, 1.0),
                                              size: screenWidth * 0.045),
                                          Text('${restaurant['rating']}'),
                                          SizedBox(width: screenWidth * 0.02),
                                          Text(restaurant['deliveryTime']),
                                        ],
                                      ),
                                      Text(
                                        restaurant['description'],
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04),
                                      ),
                                      Text(
                                        '${restaurant['city']} - ${restaurant['distance']} away',
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.04),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}



// class BigText extends StatelessWidget {
//   final String data; // The text to display
//   final double screenWidth; // Pass screenWidth for font size adjustment
//   final Color textColor; // Text color with a default value of black87
//
//   // Constructor with required data and screenWidth, and optional textColor with default value
//   const BigText({
//     super.key,
//     required this.data,
//     required this.screenWidth,
//     this.textColor = Colors.black87, // Default value for textColor
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       data,
//       style: TextStyle(
//         fontSize: screenWidth * 0.055,
//         fontWeight: FontWeight.w900,
//         color: textColor, // Use the provided or default color
//       ),
//     );
//   }
// }
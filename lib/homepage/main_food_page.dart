import 'package:flutter/material.dart';

import 'RestaurantScreen.dart';
import '../Bot/chatBot.dart';
import '../widgets/cart.dart';
import '../profile/profile.dart';
import '../restaurant/all_restaurants.dart';
class CustomSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> foodCategories = [
    {
      "name": "Pizza",
      "image": "assets/image1.jpg",
      "rating": 4.5,
      "distance": "1.2 km",
      "time": "30 min",
      "restaurant": "Pizza Hut"
    },
    {
      "name": "Burger",
      "image": "assets/image2.webp",
      "rating": 4.2,
      "distance": "2.0 km",
      "time": "20 min",
      "restaurant": "Burger King"
    },
    {
      "name": "Sushi",
      "image": "assets/image3.jpg",
      "rating": 4.8,
      "distance": "3.5 km",
      "time": "45 min",
      "restaurant": "Sushi World"
    },
    {
      "name": "Pasta",
      "image": "assets/image4.jpg",
      "rating": 4.3,
      "distance": "1.8 km",
      "time": "35 min",
      "restaurant": "Pasta House"
    },
    {
      "name": "Desserts",
      "image": "assets/image5.jpg",
      "rating": 4.9,
      "distance": "2.3 km",
      "time": "25 min",
      "restaurant": "Sweet Treats"
    },
    {
      "name": "Drinks",
      "image": "assets/image6.jpg",
      "rating": 4.0,
      "distance": "0.8 km",
      "time": "15 min",
      "restaurant": "Juice Bar"
    },// Add more categories if needed
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    // Clear search query
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Back button
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = foodCategories
        .where((category) => category['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final category = results[index];
        return ListTile(
          title: Text(category['name']),
          subtitle: Text(category['restaurant']),
          leading: Image.asset(category['image']),
          onTap: () {
            // Handle item tap (e.g., navigate to a details page)
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = foodCategories
        .where((category) => category['name'].toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final category = suggestions[index];
        return ListTile(
          title: Text(category['name']),
          subtitle: Text(category['restaurant']),
          leading: Image.asset(category['image']),
          onTap: () {
            // Handle suggestion tap
            query = category['name'];
            showResults(context);
          },
        );
      },
    );
  }
}



class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> foodCategories = [
    {
      "name": "Pizza",
      "image": "assets/image1.jpg",
      "rating": 4.5,
      "distance": "1.2 km",
      "time": "30 min",
      "restaurant": "Pizza Hut"
    },
    {
      "name": "Burger",
      "image": "assets/image2.webp",
      "rating": 4.2,
      "distance": "2.0 km",
      "time": "20 min",
      "restaurant": "Burger King"
    },
    {
      "name": "Sushi",
      "image": "assets/image3.jpg",
      "rating": 4.8,
      "distance": "3.5 km",
      "time": "45 min",
      "restaurant": "Sushi World"
    },
    {
      "name": "Pasta",
      "image": "assets/image4.jpg",
      "rating": 4.3,
      "distance": "1.8 km",
      "time": "35 min",
      "restaurant": "Pasta House"
    },
    {
      "name": "Desserts",
      "image": "assets/image5.jpg",
      "rating": 4.9,
      "distance": "2.3 km",
      "time": "25 min",
      "restaurant": "Sweet Treats"
    },
    {
      "name": "Drinks",
      "image": "assets/image6.jpg",
      "rating": 4.0,
      "distance": "0.8 km",
      "time": "15 min",
      "restaurant": "Juice Bar"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 15,
        iconSize: 28,
        selectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w900),
        unselectedFontSize: 15,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          // Navigate to the Cart screen when the Cart icon is tapped
          if (index == 1) { // 1 is the index of the Cart item in the BottomNavigationBar
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyCart()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy),
            label: "Chatbot",
            backgroundColor: Colors.black,
          ),
        ],
      ),
      body: _getBody(), // Call a method that returns the current screen's body based on currentIndex
    );

  }

  Widget _getBody() {
    if (currentIndex == 0) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              _buildFoodCategoriesSlider(),
              _buildAdditionalContent(),
            ],
          ),
        ),
      ); // Show the Home screen when "Home" is selected
    } else if (currentIndex == 2) {
      return MyProfile(); // Show the Profile screen when "Profile" is selected
    } else if (currentIndex == 3) {
      return BotpressChat(botUrl: 'https://cdn.botpress.cloud/webchat/v2.2/shareable.html?configUrl=https://files.bpcontent.cloud/2024/10/15/17/20241015170123-2JIB60O6.json',); // Show the Chatbot screen when "Chatbot" is selected
    } else {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(),
              _buildFoodCategoriesSlider(),
              _buildAdditionalContent(),
            ],
          ),
        ),
      ); // Default to the Home screen or any other default
    }
  }

  Widget _buildTopBar() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("India", style: TextStyle(color: Colors.grey)),
              Text("Gandhinagar", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          GestureDetector(
            onTap: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            child: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
              ),
              child: Icon(Icons.search, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildFoodCategoriesSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            "Popular Food Categories",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 220, // Height of the food category containers
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: foodCategories.length,
            itemBuilder: (context, index) {
              final category = foodCategories[index];
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RestaurantScreen(
                          foodItem: 'Pizza'), // Navigate to RestaurantMenu
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  margin: EdgeInsets.only(left: index == 0 ? 20 : 0, right: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius:
                        BorderRadius.vertical(top: Radius.circular(15)),
                        child: Image.asset(
                          category['image'],
                          height: 100,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category['name'],
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(Icons.star,
                                    color: Colors.orange, size: 16),
                                SizedBox(width: 3),
                                Text("${category['rating']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 3),
                            Row(
                              children: [
                                Icon(Icons.location_on,
                                    size: 16, color: Colors.red),
                                SizedBox(width: 3),
                                Text(category['distance'],
                                    style: TextStyle(fontSize: 12)),
                                SizedBox(width: 8),
                                Icon(Icons.timer, size: 16, color: Colors.blue),
                                SizedBox(width: 3),
                                Text(category['time'],
                                    style: TextStyle(fontSize: 12)),
                              ],
                            ),
                            SizedBox(height: 3),
                            Text(
                              "Restaurant: ${category['restaurant']}",
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 12),
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
      ],
    );
  }

  final List<Map<String, dynamic>> restaurants = [
    {
      "dishName": "Veg Hakka Noodles",
      "price": "₹100",
      "deliveryTime": "33 mins",
      "distance": "7.5 km",
      "restaurantName": "Order N Eat",
      "cuisineTypes": ["North Indian", "Chinese"],
      "rating": 3.4,
      "priceForOne": "₹250 for one",
      "offer": "40% OFF up to ₹80",
      "image": 'assets/noodles_img.jpg',
    },
    {
      "dishName": "Paneer Butter Masala",
      "price": "₹150",
      "deliveryTime": "25 mins",
      "distance": "5 km",
      "restaurantName": "Indian Spices",
      "cuisineTypes": ["North Indian", "Tandoori"],
      "rating": 4.2,
      "priceForOne": "₹300 for one",
      "offer": "30% OFF up to ₹100",
      "image": 'assets/paneer.jpg',
    },
    // Add more restaurants here
  ];

  Widget _buildAdditionalContent() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Popular Restaurants",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: restaurants.length, // Use the length of the list
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              return RestaurantCard(
                dishName: restaurant["dishName"],
                price: restaurant["price"],
                deliveryTime: restaurant["deliveryTime"],
                distance: restaurant["distance"],
                restaurantName: restaurant["restaurantName"],
                cuisineTypes: restaurant["cuisineTypes"],
                rating: restaurant["rating"],
                priceForOne: restaurant["priceForOne"],
                offer: restaurant["offer"],
                image: restaurant["image"], // Pass the image path
              );
            },
          ),
        ],
      ),
    );
  }



}

class RestaurantCard extends StatefulWidget {
  final String dishName;
  final String price;
  final String deliveryTime;
  final String distance;
  final String restaurantName;
  final List<String> cuisineTypes;
  final double rating;
  final String priceForOne;
  final String offer;
  final String image; // Add image path

  const RestaurantCard({
    Key? key,
    required this.dishName,
    required this.price,
    required this.deliveryTime,
    required this.distance,
    required this.restaurantName,
    required this.cuisineTypes,
    required this.rating,
    required this.priceForOne,
    required this.offer,
    required this.image, // Required image path
  }) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  // Boolean to track if the item is liked or not
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RestaurantDetailScreen(
              restaurantName: widget.restaurantName,
              image: widget.image,
              rating: widget.rating,
              cuisineTypes: widget.cuisineTypes,
              priceForOne: widget.priceForOne,
              deliveryTime: widget.deliveryTime,
              distance: widget.distance,
              offer: widget.offer,
            ),
          ),
        );
      },
      child: Container( // Added Container to provide constraints
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Added to prevent infinite height
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                    child: Image.asset(
                      widget.image,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.deliveryTime} • ${widget.distance}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                isLiked ? Icons.favorite : Icons.favorite_border,
                                size: 20,
                                color: isLiked ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  isLiked = !isLiked;
                                });
                              },
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.share, size: 20),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Text(
                      widget.restaurantName,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.cuisineTypes.join(' • ') + ' • ${widget.priceForOne}',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            '${widget.rating} ★',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.local_offer, color: Colors.blue, size: 16),
                        SizedBox(width: 4),
                        Expanded( // Added to prevent text overflow
                          child: Text(
                            widget.offer,
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
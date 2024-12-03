import 'package:flutter/material.dart';

class RestaurantDetailScreen extends StatefulWidget {
  final String restaurantName;
  final String image;
  final double rating;
  final List<String> cuisineTypes;
  final String priceForOne;
  final String deliveryTime;
  final String distance;
  final String offer;

  const RestaurantDetailScreen({
    Key? key,
    required this.restaurantName,
    required this.image,
    required this.rating,
    required this.cuisineTypes,
    required this.priceForOne,
    required this.deliveryTime,
    required this.distance,
    required this.offer,
  }) : super(key: key);

  @override
  _RestaurantDetailScreenState createState() => _RestaurantDetailScreenState();
}

class _RestaurantDetailScreenState extends State<RestaurantDetailScreen> {
  final List<Map<String, dynamic>> menuItems = [
    {
      "name": "Veg Hakka Noodles",
      "price": "₹100",
      "description": "Indo-Chinese style noodles with mixed vegetables",
      "isVeg": true,
      "image": "assets/noodles_img.jpg",
      "bestseller": true,
    },
    {
      "name": "Manchurian",
      "price": "₹120",
      "description": "Crispy vegetable balls in spicy gravy",
      "isVeg": true,
      "image": "assets/Manchurian.jpg",
      "bestseller": false,
    },
    {
      "name": "Fried Rice",
      "price": "₹90",
      "description": "Chinese style rice with vegetables",
      "isVeg": true,
      "image": "assets/friedRice.jpg",
      "bestseller": true,
    },
  ];

  Map<String, int> itemCount = {};
  double totalAmount = 0.0;

  void _addItem(String itemName, String price) {
    setState(() {
      itemCount[itemName] = (itemCount[itemName] ?? 0) + 1;
      // Add price to total (removing the ₹ symbol and converting to double)
      totalAmount += double.parse(price.substring(1));
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$itemName added. Quantity: ${itemCount[itemName]}'),
        duration: const Duration(seconds: 2),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            _removeItem(itemName, price);
          },
        ),
      ),
    );
  }

  void _removeItem(String itemName, String price) {
    setState(() {
      if (itemCount[itemName] != null && itemCount[itemName]! > 0) {
        itemCount[itemName] = itemCount[itemName]! - 1;
        totalAmount -= double.parse(price.substring(1));
        if (itemCount[itemName] == 0) {
          itemCount.remove(itemName);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                widget.image,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
              ),
              title: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white
                      .withOpacity(0.8), // Semi-transparent white background
                  borderRadius: BorderRadius.circular(4), // Rounded corners
                ),
                child: Text(
                  widget.restaurantName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cuisineTypes.join(' • '),
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: widget.rating >= 4.0
                                  ? Colors.green
                                  : Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '${widget.rating} ★',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Text(
                            '${widget.deliveryTime} • ${widget.distance}',
                            style: TextStyle(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.priceForOne,
                        style: TextStyle(
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.local_offer,
                                color: Colors.blue, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              widget.offer,
                              style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 8, color: Colors.grey[200]),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: menuItems.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final menuItem = menuItems[index];
                    final itemName = menuItem['name'] as String;
                    final count = itemCount[itemName] ?? 0;

                    return ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          menuItem['image'] as String,
                          width: screenWidth * 0.2,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 12,
                            color: menuItem['isVeg'] == true
                                ? Colors.green
                                : Colors.red,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Show a dialog with full dish name when tapped
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      content: Text(itemName),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: const Text('Close'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Tooltip(
                                    message: itemName,
                                    preferBelow: false,
                                    child: Text(
                                      itemName,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (menuItem['bestseller'] == true)
                            Container(
                              margin: const EdgeInsets.only(left: 4),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange[100],
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                'Bestseller',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.orange[900],
                                ),
                              ),
                            ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(menuItem['price'] as String),
                          const SizedBox(height: 4),
                          Text(
                            menuItem['description'] as String,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      trailing: count == 0
                          ? ElevatedButton(
                              onPressed: () =>
                                  _addItem(itemName, menuItem['price']),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text('ADD'),
                                  Icon(Icons.add, size: 16),
                                ],
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.green),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove,
                                        color: Colors.green),
                                    onPressed: () => _removeItem(
                                        itemName, menuItem['price']),
                                  ),
                                  Text(
                                    count.toString(),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add,
                                        color: Colors.green),
                                    onPressed: () =>
                                        _addItem(itemName, menuItem['price']),
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
      bottomNavigationBar: itemCount.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${itemCount.values.reduce((a, b) => a + b)} items',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '₹${totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Implement view cart functionality
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 16,
                      ),
                    ),
                    child: const Text('View Cart'),
                  ),
                ],
              ),
            ),
    );
  }
}

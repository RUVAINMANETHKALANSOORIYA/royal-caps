import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import the LoginPage widget
import 'register_screen.dart'; // Import the RegisterPage widget
import 'styles.dart'; // Import custom text styles
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  // Toggle between light and dark theme
  void _toggleThemeMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Royal Caps',
      theme: _isDarkMode
          ? ThemeData.dark() // Dark theme
          : ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ), // Light theme
      home: HomePage(toggleTheme: _toggleThemeMode), // Pass the toggle function to HomePage
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback toggleTheme;

  HomePage({required this.toggleTheme});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for bottom navigation
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(),
      ProductScreen(),
      CartScreen(),
      ProfileScreen(toggleTheme: widget.toggleTheme),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54, // Set the AppBar background color
        centerTitle: true, // Center the title text
        title: Text(
          'Royal Caps',
          style: TextStyle(
            fontFamily: 'JacquesFrancoisShadow', // Custom font family
            fontSize: 24,
          ),
        ),
      ),
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_sharp),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blueGrey[900],
        unselectedItemColor: Colors.grey[400],
      ),
    );
  }
}

// HomeScreen widget



class HomeScreen extends StatelessWidget {
  final List<String> images = [
    'images/product6.jpg',
    'images/product1.webp',
    'images/product2.webp',
    'images/product3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          // Swiper (Slideshow)
          Container(
            margin: EdgeInsets.symmetric(vertical: 0.0),
            height: MediaQuery.of(context).size.height * 0.35, // Increased height for better emphasis
            child: Swiper(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), // Add rounded corners to the slideshow images
                  child: Image.asset(
                    images[index],
                    fit: BoxFit.cover,  // Adjust to cover the whole space
                    width: MediaQuery.of(context).size.width,
                  ),
                );
              },
              autoplay: true,
              pagination: SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                  activeColor: Colors.blueGrey[900],
                  color: Colors.grey,
                  size: 8.0,
                  activeSize: 10.0,
                ),
              ),
              control: SwiperControl(),
            ),
          ),

          // Introductory text with shadow box
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isDarkMode ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 5), // Customize shadow position
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  'Welcome to Royal Caps!',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white : Colors.blueGrey[900],
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'JacquesFrancoisShadow',
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  'Discover a wide range of high-quality caps and hats, carefully designed to keep you stylish and comfortable.',
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          // Product Categories section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCategoryButton('New Arrivals', Icons.fiber_new, Colors.redAccent),
                _buildCategoryButton('Best Sellers', Icons.star, Colors.amber),
                _buildCategoryButton('On Sale', Icons.local_offer, Colors.greenAccent),
              ],
            ),
          ),

          // Call-to-Action Button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50.0),
            backgroundColor: Colors.blueGrey[900],  // Replace 'primary' with 'backgroundColor'
            shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
            ),
            ),
            onPressed: () {
            // Navigate to Product Page or Offers
            },
            child: Text(
            'Shop Now',
            style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            ),
    ),
    )
          )
    // Additional widgets can be added here
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle navigation or actions for each category
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.2),
            child: Icon(icon, color: color, size: 30),
            radius: 30,
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}


// Product screen widget

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final List<Product> products = [
    Product(
      name: 'Nike with white',
      brand: 'Nike',
      price: 200.0,
      originalPrice: 400.0,
      discount: 50,
      imageUrl: 'images/product1.webp',
    ),
    Product(
      name: 'polo with white line',
      brand: 'Nike',
      price: 400.0,
      originalPrice: 400.0,
      discount: 0,
      imageUrl: 'images/product2.webp',
    ),
    Product(
      name: 'puma with solo',
      brand: 'Nike',
      price: 12.6,
      originalPrice: 35.0,
      discount: 14,
      imageUrl: 'images/product3.jpg',
    ),
    Product(
      name: 'CK calvin',
      brand: 'Nike',
      price: 400.0,
      originalPrice: 600.0,
      discount: 33,
      imageUrl: 'images/product4.gif',
    ),
  ];

  String _sortBy = 'Name';
  Product? _selectedProduct; // Holds the currently selected product

  void _sortProducts(String criteria) {
    setState(() {
      _sortBy = criteria;
      if (criteria == 'Name') {
        products.sort((a, b) => a.name.compareTo(b.name));
      } else if (criteria == 'Price') {
        products.sort((a, b) => a.price.compareTo(b.price));
      } else if (criteria == 'Discount') {
        products.sort((a, b) => b.discount.compareTo(a.discount));
      }
    });
  }

  void _toggleFavorite(int index) {
    setState(() {
      products[index].isFavorite = !products[index].isFavorite;
    });
  }

  void _selectProduct(Product product) {
    setState(() {
      _selectedProduct = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caps For Men & Women'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: _selectedProduct != null
            ? IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              _selectedProduct = null; // Deselect the product
            });
          },
        )
            : null,
      ),
      body: _selectedProduct == null
          ? _buildProductListView()
          : _buildProductDetailView(_selectedProduct!),
    );
  }

  // Build the product list view
  Widget _buildProductListView() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sort by:',
                style: TextStyle(fontSize: 18),
              ),
              DropdownButton<String>(
                value: _sortBy,
                icon: Icon(Icons.arrow_drop_down),
                items: <String>['Name', 'Price', 'Discount'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    _sortProducts(newValue);
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: EdgeInsets.all(8.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.6,
            ),
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              final product = products[index];
              return GestureDetector(
                onTap: () {
                  _selectProduct(product); // Select product
                },
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12),
                            ),
                            child: Image.asset(
                              product.imageUrl,
                              width: double.infinity,
                              height: 140,
                              fit: BoxFit.cover,
                            ),
                          ),
                          if (product.discount > 0)
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                                color: Colors.yellow,
                                child: Text(
                                  '${product.discount}% OFF',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: IconButton(
                              icon: Icon(
                                product.isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: product.isFavorite ? Colors.red : Colors.grey,
                              ),
                              onPressed: () {
                                _toggleFavorite(index);
                              },
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 5),
                            Text(
                              product.brand,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                if (product.originalPrice > product.price)
                                  Text(
                                    '\$${product.originalPrice.toStringAsFixed(1)}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                SizedBox(width: 5),
                                Text(
                                  '\$${product.price.toStringAsFixed(1)}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 16),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Align(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.add_shopping_cart),
                                onPressed: () {
                                  // Handle add to cart action
                                },
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
      ],
    );
  }

  // Build the product detail view
  Widget _buildProductDetailView(Product product) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              product.imageUrl,
              height: MediaQuery.of(context).size.height * 0.3,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Text(
            product.name,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            product.brand,
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              if (product.originalPrice > product.price)
                Text(
                  '\$${product.originalPrice.toStringAsFixed(1)}',
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: TextDecoration.lineThrough,
                    fontSize: 20,
                  ),
                ),
              SizedBox(width: 10),
              Text(
                '\$${product.price.toStringAsFixed(1)}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.green),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Handle Add to Cart action
            },
            child: Text('Add to Cart'),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String brand;
  final double price;
  final double originalPrice;
  final int discount;
  final String imageUrl;
  bool isFavorite;

  Product({
    required this.name,
    required this.brand,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.imageUrl,
    this.isFavorite = false,
  });
}




// Cart screen widget
class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {'name': 'Air Max 270', 'price': 12.5, 'quantity': 1, 'image': 'images/product1.webp'},
    {'name': 'Nike Blues', 'price': 17.0, 'quantity': 1, 'image': 'images/product2.webp'},
    {'name': 'Air Max', 'price': 13.0, 'quantity': 1, 'image': 'images/product3.jpg'},
    {'name': 'Run Didas', 'price': 9.99, 'quantity': 1, 'image': 'images/product4.gif'},
    {'name': 'Max 270', 'price': 6.99, 'quantity': 1, 'image': 'images/product5.jpg'},
    {'name': 'Black Runner', 'price': 12.9, 'quantity': 1, 'image': 'images/product6.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.white,

      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Image.asset(
                          cartItems[index]['image'],
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Icon(Icons.error, size: 80);  // Fallback for missing image
                          },
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItems[index]['name'],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '\$${cartItems[index]['price'].toStringAsFixed(2)}',
                                style: TextStyle(color: Colors.grey[700], fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                // Logic for decreasing item quantity
                              },
                            ),
                            Text(cartItems[index]['quantity'].toString()),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                // Logic for increasing item quantity
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: ElevatedButton(
              onPressed: () {
                // Logic for processing payment
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15),
                backgroundColor: Colors.black,
              ),
              child: Text(
                'Pay (\$${totalPrice.toStringAsFixed(2)})',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void Cartmain() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CartScreen(),
  ));
}


// Profile screen widget
/// Profile screen widget
class ProfileScreen extends StatelessWidget {
  final VoidCallback toggleTheme;

  ProfileScreen({required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),

            // Profile Avatar, Name, Phone, and Email
            const Center(
              child: Column(
                children: [
                  // Circular avatar with new image
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.jpeg'), // Updated with profile.jpeg
                  ),
                  SizedBox(height: 10),

                  // User name
                  Text(
                    'Maneth', // Replace with dynamic user info if needed
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),

                  // Phone number
                  Text(
                    '0761629135', // Replace with dynamic user info
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),

                  // Email
                  Text(
                    'maneth@gmail.com', // Replace with dynamic user info
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // List of options with icons
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  _buildProfileOption(Icons.history, 'Order History', context),
                  _buildProfileOption(Icons.location_on, 'Shipping Address', context),
                  _buildProfileOption(Icons.request_page, 'Create Request', context),
                  _buildProfileOption(Icons.privacy_tip, 'Privacy Policy', context),
                  _buildProfileOption(Icons.settings, 'Settings', context),
                  _buildProfileOption(Icons.logout, 'Log out', context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build the profile option item
  Widget _buildProfileOption(IconData icon, String title, BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.orange),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey),
      onTap: () {
        if (title == 'Settings') {
          // Navigate to SettingsScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SettingsScreen(toggleTheme: toggleTheme)),
          );
        } else if (title == 'Log out') {
          // Navigate to LoginPage on logout
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginPage(toggleTheme: toggleTheme)), // Replace with your actual login page
          );
        }
      },
    );
  }
}


// Settings screen widget with dark theme toggle
class SettingsScreen extends StatefulWidget {
  final VoidCallback toggleTheme;

  SettingsScreen({required this.toggleTheme});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();
    // Optionally initialize the dark mode value here if needed
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'App Settings',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dark Mode',
                  style: TextStyle(fontSize: 18),
                ),
                Switch(
                  value: _isDarkMode,
                  onChanged: (value) {
                    setState(() {
                      _isDarkMode = value;
                    });
                    widget.toggleTheme(); // Toggle theme mode
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';

void main() {
  runApp(const PremiumStoreApp());
}

class PremiumStoreApp extends StatelessWidget {
  const PremiumStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'sans-serif',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _selectedIndex = 0;

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return _buildHomeView();
      case 1:
        return const Center(child: Text('LAUNCHES', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5)));
      case 2:
        return const Center(child: Text('SHOP CATALOG', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5)));
      case 3:
        return const Center(child: Text('BAG IS EMPTY', style: TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5)));
      case 4:
        return const PumaAuthScreen();
      default:
        return _buildHomeView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 16,
        title: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.black87, size: 22),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'SEARCH PRODUCTS...',
                    hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13, fontWeight: FontWeight.w600),
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.person_outline, color: Colors.black87, size: 22),
                onPressed: () {
                  setState(() => _selectedIndex = 4);
                },
              ),
            ],
          ),
        ),
      ),
      body: _buildBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on_outlined),
            activeIcon: Icon(Icons.flash_on),
            label: 'HOME',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            activeIcon: Icon(Icons.calendar_today),
            label: 'LAUNCHES',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search),
            activeIcon: Icon(Icons.manage_search),
            label: 'SHOP',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: 'BAG',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'ACCOUNT',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeView() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 380,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1552346154-21d32810aba3?auto=format&fit=crop&w=1000&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 380,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.75),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'CHANGE OF PACE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w900,
                        letterSpacing: 1.2,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'GEAR UP FOR THE NEW SEASON',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border(right: BorderSide(color: Colors.grey.shade800, width: 0.5)),
                  ),
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Viewing: FOR HIM')),
                      );
                    },
                    child: const Text(
                      'FOR HIM',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 13),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 52,
                  color: Colors.black,
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Viewing: FOR HER')),
                      );
                    },
                    child: const Text(
                      'FOR HER',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 1.5, fontSize: 13),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'LATEST DROPS',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900, letterSpacing: 1.2),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 240,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _buildProductCard(
                  imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=500&q=80',
                  title: 'Speedcat OG Sneakers',
                  price: '₹7,999',
                  isNew: true,
                ),
                _buildProductCard(
                  imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?auto=format&fit=crop&w=500&q=80',
                  title: 'Palermo Suede Special',
                  price: '₹6,499',
                  isNew: true,
                ),
                _buildProductCard(
                  imageUrl: 'https://images.unsplash.com/photo-1607522370275-f14206abe5d3?auto=format&fit=crop&w=500&q=80',
                  title: 'Suede Classic XXI',
                  price: '₹5,999',
                  isNew: false,
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String imageUrl,
    required String title,
    required String price,
    required bool isNew,
  }) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected: $title')),
        );
      },
      child: Container(
        width: 170,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(4),
                    image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
                  ),
                ),
                if (isNew)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      color: Colors.black,
                      child: const Text(
                        'NEW',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.8),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 4),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

// Puma Style Login / Registration Screen
class PumaAuthScreen extends StatefulWidget {
  const PumaAuthScreen({super.key});

  @override
  State<PumaAuthScreen> createState() => _PumaAuthScreenState();
}

class _PumaAuthScreenState extends State<PumaAuthScreen> {
  bool isLogin = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isLogin ? 'MY ACCOUNT' : 'JOIN THE CLUB',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900, letterSpacing: 1.5),
          ),
          const SizedBox(height: 8),
          Text(
            isLogin ? 'Sign in to access your orders and wishlist.' : 'Create an account for faster checkout and exclusive drops.',
            style: TextStyle(color: Colors.grey.shade600, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 32),
          const Text('EMAIL ADDRESS *', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 1)),
          const SizedBox(height: 8),
          TextField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.grey.shade400)),
              focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.black, width: 2)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            ),
          ),
          const SizedBox(height: 20),
          const Text('PASSWORD *', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11, letterSpacing: 1)),
          const SizedBox(height: 8),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.grey.shade400)),
              focusedBorder: const OutlineInputBorder(borderRadius: BorderRadius.zero, borderSide: BorderSide(color: Colors.black, width: 2)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
            ),
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                elevation: 0,
              ),
              onPressed: () {
                final action = isLogin ? 'Signed In' : 'Registered';
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$action successfully as ${_emailController.text}')),
                );
              },
              child: Text(
                isLogin ? 'LOGIN' : 'CREATE ACCOUNT',
                style: const TextStyle(fontWeight: FontWeight.w900, letterSpacing: 1.5, fontSize: 13),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: TextButton(
              onPressed: () => setState(() => isLogin = !isLogin),
              child: Text(
                isLogin ? 'NEED AN ACCOUNT? JOIN NOW' : 'ALREADY HAVE AN ACCOUNT? LOGIN',
                style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12, decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

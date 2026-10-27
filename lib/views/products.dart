import 'package:flutter/material.dart';
import 'package:task_three/views/product_details_page.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  String cartMessage = '';
  int favorites = 0;
  double screenWidth = 0;
  double screenHeight = 0;

  final List<Map<String, dynamic>> products = [
    {'name': 'Laptop', 'price': 25000.0},
    {'name': 'Phone', 'price': 15000.0},
    {'name': 'Headphones', 'price': 1200.0},
    {'name': 'Keyboard', 'price': 800.0},
  ];

  final Set<int> favoriteProducts = {};

  @override
  void initState() {
    super.initState();
    print('ProductsPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final size = MediaQuery.sizeOf(context);
    screenWidth = size.width;
    screenHeight = size.height;

    print(
      "ProductsPage: didChangeDependencies -> "
      "width: ${size.width}, height: ${size.height}",
    );
    print('ProductsPage: didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('ProductsPage: deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('ProductsPage: dispose');
  }

  Future<void> openDetails(Map<String, dynamic> product) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsPage(
          name: product['name'],
          price: product['price'],
        ),
      ),
    );

    if (!mounted) return;

    if (result != null) {
      setState(() {
        cartMessage = result;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products - Welcome <$username>",
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              cartMessage.isEmpty
                  ? 'Your cart is empty'
                  : cartMessage,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ListTile(
                  title: Text(product['name']),
                  subtitle: Text('${product['price']} EGP'),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: () => openDetails(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
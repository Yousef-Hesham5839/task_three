import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  int favorites = 0;
  double screenWidth = 0;
  double screenHeight = 0;

  final List<String> products = [
    'Product 1',
    'Product 2',
    'Product 3',
    'Product 4',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "LoginPage",
          style: TextStyle(
            fontSize: 22,
          ),
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
              'Favorites: $favorites',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final isFavorite =
                    favoriteProducts.contains(index);

                return ListTile(
                  title: Text(products[index]),
                  trailing: IconButton(
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        if (isFavorite) {
                          favoriteProducts.remove(index);
                          favorites--;
                        } else {
                          favoriteProducts.add(index);
                          favorites++;
                        }
                      });
                    },
                  ),
                );
              },
            ),
         ),
        ],
      ),
    );
  }
}

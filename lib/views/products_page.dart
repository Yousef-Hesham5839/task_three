import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_three/widgets/product_widgets.dart';

class ProductsPage extends StatefulWidget {
  final String username;
  const ProductsPage({super.key, required this.username});

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
   final name = Uri.encodeComponent(product['name'] as String);
   final price = product['price'].toString();
 
   final result = await context.push<String>(
     '/product_details/$name/$price',
   );
 
   if (!mounted) return;
 
   if (result != null) {
     setState(() {
       cartMessage = result;
     });
   }
 }


    /*
    OLD NAVIGATOR CODE:

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
    */

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Products - Welcome <${widget.username}>",
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
              child: Column(
                children: [
                  Text(
                    'Favorites: $favorites',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Screen width: ${screenWidth.toStringAsFixed(1)}'),
                  const SizedBox(height: 8),
                  Text(
                    cartMessage.isEmpty ? 'Your cart is empty' : cartMessage,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            
            Expanded(
             child: screenWidth < 600 ? ProductsListView(
              products: products,
              onFavoritePressed: () {
               setState(() {
                favorites++;
               });
              },
              onProductTap: (index) {
               openDetails(products[index]);
              },
             )
             : ProductsGridView(
               products: products,
               onFavoritePressed: () {
                setState(() {
                 favorites++;
                });
               },
               onProductTap: (index) {
                openDetails(products[index]);
               },
              ),
            ),
          ],
        ),
      );
    }

    Widget buildProduct(int index) {
      final product = products[index];
      final isFavorite = favoriteProducts.contains(index);

      return Card(
        child: ListTile(
          title: Text(product['name']),
          subtitle: Text('${product['price']} EGP'),
          onTap: () => openDetails(product),
          trailing: IconButton(
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
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
        ),
      );
    }
}

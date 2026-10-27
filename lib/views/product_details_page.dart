import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  final String name;
  final double price;

  const ProductDetailsPage({super.key, required this.name, required this.price});

  @override
  State<StatefulWidget> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  @override
  void initState() {
    super.initState();
    print('ProductDetailsPage: initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('ProductDetailsPage: didChangeDependencies');
  }

  @override
  void deactivate() {
    super.deactivate();
    print('ProductDetailsPage: deactivate');
  }

  @override
  void dispose() {
    super.dispose();
    print('ProductDetailsPage: dispose');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ProuctDetailsPage",
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.name,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Price: ${widget.price.toStringAsFixed(2)} EGP',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  '${widget.name} added to cart',
                );
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

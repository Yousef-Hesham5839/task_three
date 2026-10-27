import 'package:flutter/material.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key});

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
      body: SizedBox()
    );
  }
}

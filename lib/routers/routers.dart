import 'package:go_router/go_router.dart';
import 'package:task_three/views/login_page.dart';
import 'package:task_three/views/product_details_page.dart';
import 'package:task_three/views/products.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => LoginPage()),
    GoRoute(path: "/products", builder: (context, state) => ProductsPage()),
    GoRoute(path: "/product_details", builder: (context, state) => ProductDetailsPage()),
  ],
);

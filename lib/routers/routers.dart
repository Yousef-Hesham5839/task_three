
import 'package:go_router/go_router.dart';
import 'package:task_three/views/login_page.dart';
import 'package:task_three/views/product_details_page.dart';
import 'package:task_three/views/products_page.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),

    GoRoute(
      path: '/products',
      name: 'products',
      builder: (context, state) {
        return ProductsPage();
      },
    ),

    GoRoute(
      path: '/product_details/:name/:price',
      name: 'details',
      builder: (context, state) {
        final name = state.pathParameters['name']!;
        final price = double.parse(
          state.pathParameters['price']!,
        );

        return ProductDetailsPage(
          name: name,
          price: price,
        );
      },
    ),
  ],
);

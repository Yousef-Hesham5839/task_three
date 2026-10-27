/*
Flutter Lifecycle Questions

a) Which methods run when a page opens for the first time?
   - createState() creates the State object.
   - initState() runs once when the State object is created.
   - didChangeDependencies() runs after initState().
   - build() runs to display the UI.

b) Which method runs again after you press the heart button?
   - setState() triggers a rebuild.
   - build() runs again to update the Favorites counter
     and the heart icon.
   - initState() does not run again.

c) Which methods run when you leave a page and go back?
   - When leaving a page, dispose() runs if the page is
     removed from the widget tree and its State is destroyed.
   - When returning, createState(), initState(),
     didChangeDependencies(), and build() run again
     if a new page instance is created.
   - If the page remains mounted, its State may be preserved,
     so these methods do not necessarily all run again.

d) Which methods run when you resize the browser window, and why?
   - didChangeDependencies() can run again when the
     MediaQuery dependencies change.
   - build() runs to update the UI based on the new screen size.
   - The layout switches between ListView and GridView
     depending on whether the width is below 600 pixels.
   - initState() does not run again just because the
     browser window is resized.
*/



/*
Part 4 – Short Answers

1. What is the difference between context.go and context.push?
   - context.go navigates to a new location and replaces the
     current navigation route configuration.
     Example: context.goNamed('products',
     queryParameters: {'user': 'Guest'});

   - context.push adds a new page on top of the current page
     and allows returning a result.
     Example: context.push<String>('/details/Laptop/25000.0');

2. Why did we use go for Login -> Products and push for
   Products -> Details?
   - We used go for Login -> Products because Login should
     not remain as a page to return to using the Back button.
   - We used push for Products -> Details because we want
     to return to Products and receive the result from the
     Details page when the user taps "Add to Cart".

3. What is the difference between a path parameter and a
   query parameter? Show one URL from your app for each.
   - A path parameter is part of the URL path and identifies
     a specific resource or item.
     Example: /details/Laptop/25000.0
     Here, "Laptop" is the name and "25000.0" is the price.

   - A query parameter comes after ? in the URL and is
     commonly used to pass optional information or filters.
     Example: /products?user=Guest
     Here, "user" is the query parameter and "Guest" is
     its value.
*/



import 'package:flutter/material.dart';
import 'package:task_three/routers/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Products", routerConfig: router,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.blueAccent),
      ),
    );
  }
}

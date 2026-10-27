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

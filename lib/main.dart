import 'package:flutter/material.dart';
import 'package:sliver_widget_poc/multi_scrolling_with_sliver.dart';
import 'package:sliver_widget_poc/multi_view_scroll_screen.dart';
import 'package:sliver_widget_poc/sliver_example_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Colors.deepPurpleAccent,
        ), //<-- SEE HERE

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Explore Sliver'),
          ),
          body: const HomePage()),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MultiViewScrollScreen()));
            },
            child: const Text('Multi-View Scroll (Old Approach)'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const MultiViewScrollNewApproachScreen()));
            },
            child: const Text('Multi-View Scroll (Sliver Approach)'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SliverExampleScreen()));
            },
            child: const Text('Sliver Full Example'),
          ),
        ],
      ),
    );
  }
}

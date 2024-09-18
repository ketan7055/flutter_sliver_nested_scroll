import 'package:flutter/material.dart';

class MultiViewScrollScreen extends StatelessWidget {
  const MultiViewScrollScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-View Scroll (Old Approach)'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              color: Colors.blue,
              child: const Center(
                  child: Text('Header View',
                      style: TextStyle(color: Colors.white, fontSize: 24))),
            ),
            ListView(
              padding: const EdgeInsets.all(0.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                Container(
                    height: 200,
                    color: Colors.red,
                    child: const Center(child: Text('View 1'))),
                Container(
                    height: 200,
                    color: Colors.green,
                    child: const Center(child: Text('View 2'))),
                Container(
                    height: 200,
                    color: Colors.yellow,
                    child: const Center(child: Text('View 3'))),
                Container(
                    height: 200,
                    color: Colors.brown,
                    child: const Center(child: Text('View 4'))),
                Container(
                    height: 200,
                    color: Colors.indigoAccent,
                    child: const Center(child: Text('View 5'))),
                Container(
                    height: 200,
                    color: Colors.purpleAccent,
                    child: const Center(child: Text('View 6'))),
              ],
            ),
            Container(
              height: 100,
              color: Colors.amber,
              child: const Center(
                  child: Text('Footer View',
                      style: TextStyle(color: Colors.white, fontSize: 24))),
            ),
          ],
        ),
      ),
    );
  }
}

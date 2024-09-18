import 'package:flutter/material.dart';

class MultiViewScrollNewApproachScreen extends StatelessWidget {
  const MultiViewScrollNewApproachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multi-View Scroll (Sliver Approach)'),
      ),
      body:
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(8.0),
                child: const Center(child: Text('Header View', style: TextStyle(fontSize: 24))),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
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
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 100,
                color: Colors.greenAccent,
                padding: const EdgeInsets.all(8.0),
                child: const Center(child: Text('Footer View', style: TextStyle(fontSize: 24))),
              ),
            ),
          ],
        ),

    );
  }
}

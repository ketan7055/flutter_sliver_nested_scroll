
import 'package:flutter/material.dart';

class SliverExampleScreen extends StatelessWidget {
  const SliverExampleScreen({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        // Changes the way the inner and outer scroll are linked together
        floatHeaderSlivers: true,
        // This builds the scrollable content above the body
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          // This redirects the amount of the overlap to the injector
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            sliver: SliverAppBar(
              title: const Text('App Bar'),
              expandedHeight: 200,
              // pinned: true,
              floating: true,
              snap: false,
              forceElevated: innerBoxIsScrolled,
            ),
          ),
        ],
        // The content of the scroll view
        body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 10,
                  (context, index) => ListTile(
                    title: Text(
                      'Text $index',
                    ),
                  ),
                ),
              ),
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.teal[100 * (index % 9)],
                      child: Text('grid item $index'),
                    );
                  },
                  childCount: 20,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 2.0,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8.0),
                  child:
                      const Text('Grid Header', style: TextStyle(fontSize: 24)),
                ),
              ),
              SliverGrid.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
                children: <Widget>[
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.blue),
                  Container(color: Colors.red),
                  Container(color: Colors.green),
                  Container(color: Colors.blue),
                ],
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8.0),
                  child:
                      const Text('Grid Extent', style: TextStyle(fontSize: 24)),
                ),
              ),
              SliverGrid.extent(
                maxCrossAxisExtent: 100,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
                children: <Widget>[
                  Container(color: Colors.pink),
                  Container(color: Colors.indigo),
                  Container(color: Colors.orange),
                  Container(color: Colors.pink),
                  Container(color: Colors.indigo),
                  Container(color: Colors.orange),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

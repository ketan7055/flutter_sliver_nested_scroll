import 'package:flutter/material.dart';

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
    color: Colors.deepPurpleAccent,), //<-- SEE HERE
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Scaffold(body:   SliverWidget()),
      home: const Scaffold(body:   MyHomePageWithNestedScrollViewAndSnappingAppBar()),
    );
  }
}
class MyHomePageWithNestedScrollViewAndSnappingAppBar extends StatelessWidget {
  const MyHomePageWithNestedScrollViewAndSnappingAppBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      // Changes the way the inner and outer scroll are linked together
      floatHeaderSlivers: false,
      // This builds the scrollable content above the body
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        // This redirects the amount of the overlap to the injector
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            title: const Text('App Bar'),
            // expandedHeight: 200,
            // pinned: true,
            floating: true,
            snap: true,
            /// keep  floating: true,  snap: true,  for floating appbar
            /// pinned: true and no remove property snap with pinned
            forceElevated: innerBoxIsScrolled,
          ),
        ),
      ],
      // The content of the scroll view
      body: Builder(builder: (context) {
        return CustomScrollView(
          slivers: [
            // Injects the overlapped amount into the scrollable area
            // SliverOverlapInjector(
            //   handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            // ),
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
                child: const Text('Grid Header', style: TextStyle(fontSize: 24)),
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
                child: const Text('Grid Extent', style: TextStyle(fontSize: 24)),
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
    );
  }
}

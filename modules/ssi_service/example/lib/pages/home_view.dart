import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(color: Colors.black),
            height: 50,
            child: const TabBar(
              labelStyle: TextStyle(height: 0, fontSize: 10),
              tabs: <Widget>[
                Tab(
                  text: '首页',
                  icon: Icon(Icons.ice_skating),
                ),
                Tab(
                  text: '首页2',
                  icon: Icon(Icons.movie_creation),
                ),
              ],
            ),
          )// This trailing comma makes auto-formatting nicer for build methods.
        )
    );


  }
}


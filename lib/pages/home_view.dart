import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './home_logic.dart';
import './testRoutePage/testRoutePage_view.dart';

class HomePage extends StatefulWidget{

  HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;
  var homeLogic = Get.put(HomeLogic());
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
                // GetBuilder<HomeLogic>(builder: (logic){
                //   return Text(
                //     '${homeLogic.count.value}',
                //     style: Theme.of(context).textTheme.headlineMedium,
                //   );
                // })
                Obx(() => Text(
                  '${homeLogic.count.value}',
                  style: Theme.of(context).textTheme.headlineMedium,
                )),
                TextButton(
                  child: const Text(
                    '跳转',
                  ),
                  onPressed:()=>{
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context){
                          return testRoutePage();
                        })
                    )
                  }
                ),

              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            // onPressed: _incrementCounter,
            onPressed: ()=>homeLogic.increase(),

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


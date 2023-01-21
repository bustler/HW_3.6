// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String? strAssets;
  final _controller = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  
  void _incrementLongCounter() {
    setState(() {
      _counter += 100;
    });
  }

  void _defaultValue(){
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(
                  width: 250.0,
                  height: 30.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: _incrementCounter, 
                    onLongPress: _incrementLongCounter,
                    child: Text(
                      'Add point',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color.fromARGB(255, 180, 19, 255))
                    ),
                  ),
                ),
              ]),
              Text(
                '$_counter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.w100,
                  fontStyle: FontStyle.italic,
                ),
              ),
              
              SvgPicture.asset(
                'assets/images/flutter_logo.svg', 
                width: _counter+100, 
                height: _counter+100,
              ),

              CarouselSlider(
                options: CarouselOptions(
                  height: 250.0,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.4,
                ),
                items: [1,2,3,4,5].map((i) {
                  return Builder(
                    builder: (BuildContext context){
                      return Container(
                        width: 300,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 11, 250, 198),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Test $i', style: TextStyle(fontSize: 20)),
                            Image.asset(
                              'assets/images/$i.jpg',
                              height: 200,
                            ),
                          ]
                        )
                      );
                    },
                  );
                }).toList(),
              ),

              SizedBox(height: 30,)
            ],
      ),
      floatingActionButton: FloatingActionButton(
        splashColor: Colors.purple,
        onPressed: _defaultValue,
        tooltip: 'Increment',
        child: const Icon(Icons.home),
      ), 
    );
  }
}


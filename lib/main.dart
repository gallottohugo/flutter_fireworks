import 'package:flutter/material.dart';
import 'package:flutter_fireworks/fireworks_widget.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Fireworks',
      debugShowCheckedModeBanner: false,
			theme: ThemeData(
				primarySwatch: Colors.blue,
				visualDensity: VisualDensity.adaptivePlatformDensity,
			),
			home: MyHomePage(),
		);
	}
}

class MyHomePage extends StatefulWidget {
  	MyHomePage({Key key}) : super(key: key);


  	@override
  	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FireworksWidget()
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_news_watch/home.dart';
import 'package:flutter_news_watch/components/splash/ImageSplashScreen.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatefulWidget {

	State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State {
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'NEWS WATCH',
			theme: ThemeData(
				primaryColor: Color.fromARGB(255, 254, 85, 106),
			),
//			initialRoute: Home.rName,
			home: ImageSplashScreen(),
			routes: {
				Home.rName: (context) {
					return Home();
				}
			},
		);
	}
}

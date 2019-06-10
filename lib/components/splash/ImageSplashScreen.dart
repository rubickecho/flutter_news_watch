import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSplashScreen extends StatefulWidget {
	@override
	SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<ImageSplashScreen> {
	startTime() async {
		var _duration = new Duration(seconds: 4);
		return new Timer(_duration, navigationPage);
	}

	void navigationPage() {
		Navigator.of(context).pushReplacementNamed('home');
	}

	@override
	void initState() {
		super.initState();
		startTime();
	}

	@override
	Widget build(BuildContext context) {
		return new Scaffold(
			body: Container(
				color: Colors.white,
			  	child: new Stack(
			  		fit: StackFit.expand,
			  		children: <Widget>[
			  			Image.asset('assets/images/dribbble_orange.gif'),
			  		],
			  	),
			),
		);
	}
}

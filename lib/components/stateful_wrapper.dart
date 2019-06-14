import 'package:flutter/material.dart';

class StateFulWrapper extends StatefulWidget {
	final Function onInit;
	final Widget child;

	StateFulWrapper({Key key, this.onInit, this.child}) : super(key: key);

	_StateFulWrapper createState() => _StateFulWrapper();
}

class _StateFulWrapper extends State<StateFulWrapper> {
	@override
	void initState() {
		widget.onInit();
		super.initState();
	}

	Widget build(BuildContext context) {
		return widget.child;
	}
}

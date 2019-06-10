import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Detail extends StatefulWidget {
	static final String rName = 'detail';
	final String content;

	Detail(this.content);
	State<StatefulWidget> createState() => DetailState(this.content);
}

class DetailState extends State<Detail> {
	final String content;

	DetailState(this.content);

	@override
	void initState() {
		super.initState();
	}

	Widget build(BuildContext context) {
		return Material(
			child: new WebviewScaffold(
				url: this.content,
				appBar: new AppBar(
					title: new Text("Widget webview"),
				),
			),
		);
	}
}

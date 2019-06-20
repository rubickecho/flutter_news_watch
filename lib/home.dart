import 'package:flutter/material.dart';
import 'package:flutter_news_watch/common/dao/NewsDao.dart';
import 'package:flutter_news_watch/common/model/TopHeadlines.dart';
import 'package:flutter_news_watch/detail.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
	static final String rName = 'home';
	State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
	TabController _tabController;
	TopHeadlines _topHeadlines;
	List<String> categorys = ['Business', 'Entertainment', 'General', 'Health', 'Science', 'Sports', 'Technology'];
	List<Tab> defaultTabs = [];

	void getAllHeadLines(String category) async {
		NewsDao.getAllHeadLines(category).then((res) {
			if (res.status) {
				setState(() {
					_topHeadlines = res.data;
				});
			}
		});
	}

	@override
	void initState() {
		setState(() {
			for(int i = 0; i < categorys.length; i++) {
				defaultTabs.add(Tab(text: categorys[i]));
			}
		});
		_tabController = TabController(length: defaultTabs.length, vsync: this);
		this.getAllHeadLines(categorys.first);
		super.initState();
	}

	@override
	void dispose() {
		_tabController.dispose();
		super.dispose();
	}

	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('News Watch'),
				actions: <Widget>[
					IconButton(
						icon: Icon(
							Icons.search,
							color: Colors.white,
						),
						onPressed: () {
							Navigator.of(context).pushReplacementNamed('detail');
						},
					)
				],
				bottom: TabBar(
					controller: _tabController,
					tabs: defaultTabs,
					isScrollable: true,
					indicatorColor: Colors.white,
					indicatorWeight: 3.0,
					onTap: (index) {
						setState(() {
							TopHeadlines empty;
							_topHeadlines = empty;
						});
						this.getAllHeadLines(categorys[index]);
					},
				),
			),
			body: Container(
				child: TabBarView(
					controller: _tabController,
					children: defaultTabs.map((Tab tab) {
						if (_topHeadlines == null) {
							return Center(
								child: Column(
									mainAxisAlignment: MainAxisAlignment.center,
									children: <Widget>[
										SpinKitDoubleBounce(
											color: Theme.of(context).primaryColor,
											size: 50.0,
										),
										Text(
											'Loading'
										)
									],
								),
							);
						} else {
							return ListView.builder(
								padding: EdgeInsets.all(12.0),
								itemCount: _topHeadlines.articles.length,
								itemBuilder: (BuildContext context, int index) {
									return Card(
										elevation: 2,
										shape: RoundedRectangleBorder(
											borderRadius: BorderRadius.all(Radius.circular(4))
										),
										child: InkWell(
											onTap: () {
												Navigator.of(context).push(new PageRouteBuilder(
													pageBuilder: (BuildContext context, Animation<double> animation,
														Animation<double> secondaryAnimation) {
														return new Detail(_topHeadlines.articles[index].title, _topHeadlines.articles[index].url);
													}
												));
											},
											child: Column(
												mainAxisSize: MainAxisSize.max,
												children: <Widget>[
													Container(
														height: 140,
														color: Colors.grey[200],
														child: new FadeInImage.memoryNetwork(
															width: double.infinity,
															fit: BoxFit.fitWidth,
															placeholder: kTransparentImage,
															image: _topHeadlines.articles[index].urlToImage != null ? _topHeadlines.articles[index].urlToImage : 'assets/images/news_presenter.png'
														),
													),
													Padding(
														padding: EdgeInsets.all(8),
														child: Text(
															_topHeadlines.articles[index].title,
															style: TextStyle(
																fontSize: 18,
																fontWeight: FontWeight.w500,
																color: Color.fromARGB(255, 61, 61, 65)
															),
														),
													),
													Padding(
														padding: EdgeInsets.fromLTRB(8, 0, 8, 12),
														child: Row(
															mainAxisAlignment: MainAxisAlignment.spaceBetween,
															children: <Widget>[
																Text(
																	_topHeadlines.articles[index].source.name,
																	style: TextStyle(
																		fontSize: 12,
																		color: Color.fromARGB(255, 146, 150, 159)
																	),
																),
																Text(
																	(DateFormat.MMMMEEEEd().format(
																		_topHeadlines.articles[index].publishedAt
																			.toLocal()) +
																		" " +
																		DateFormat.jm().format(
																			_topHeadlines.articles[index].publishedAt
																				.toLocal())),
																	style: TextStyle(
																		fontSize: 12,
																		color: Colors.grey
																	),
																)
															],
														),
													)
												],
											),
										)
									);
								}
							);
						}
					}).toList()
				),
			)
		);
	}
}

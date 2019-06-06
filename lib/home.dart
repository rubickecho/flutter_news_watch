import 'package:flutter/material.dart';
import 'package:flutter_news_watch/common/dao/NewsDao.dart';
import 'package:flutter_news_watch/common/dao/SourcesDao.dart';
import 'package:flutter_news_watch/common/model/TopHeadlines.dart';
import 'package:flutter_news_watch/common/model/Source.dart';

class Home extends StatefulWidget {
	static final String rName = 'home';
	State<StatefulWidget> createState() => HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
	TabController _tabController;
	TopHeadlines _topHeadlines;
	List<Tab> defaultTabs = <Tab>[
	];

	void getAllHeadLines() async {
		NewsDao.getAllHeadLines().then((res) {
			if (res.status) {
				setState(() {
					_topHeadlines = res.data;
				});
			}
			print(res.status);
			print(res.data.articles.length);
		});
	}

	void getSources() async {
		SourcesDao.getSources().then((res) {
			if (res.status) {
				for(int i = 0; i < 5; i++) {
					setState(() {
						print(res.data.sources[i].name);
						defaultTabs.add(Tab(text: res.data.sources[i].name));
					});
				}
				_tabController = TabController(length: defaultTabs.length, vsync: this);
			}
			print(res.status);
			print(res.data.sources.length);
		});
	}

	@override
	void initState() {
		super.initState();
		this.getSources();
		this.getAllHeadLines();
	}

	@override
	void dispose() {
		_tabController.dispose();
		super.dispose();
	}


	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text('News'),
				actions: <Widget>[
					IconButton(
						icon: Icon(
							Icons.search,
							color: Colors.white,
						),
						onPressed: () {
							this.getAllHeadLines();
						},
					)
				],
				bottom: TabBar(
					controller: _tabController,
					tabs: defaultTabs,
					isScrollable: true,
					indicatorColor: Colors.white,
					indicatorWeight: 3.0
				),
			),
			body: Container(
				child: TabBarView(
					controller: _tabController,
					children: defaultTabs.map((Tab tab) {
						return ListView.builder(
							padding: EdgeInsets.all(12.0),
							itemCount: _topHeadlines.articles.length,
							itemBuilder: (BuildContext context, int index) {
								return Card(
									elevation: 2,
									shape: RoundedRectangleBorder(
										borderRadius: BorderRadius.all(Radius.circular(4))
									),
									child: Column(
										children: <Widget>[
											Container(
												height: 140,
												color: Colors.green,
												child: new Image(
													fit: BoxFit.fill,
													image: _topHeadlines.articles[index].urlToImage != null ? NetworkImage(
														_topHeadlines.articles[index].urlToImage
													) : AssetImage(
														'assets/images/news_presenter.png'
													),
												)
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
															_topHeadlines.articles[index].publishedAt,
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
								);
							}
						);
					}).toList()
				),
			)
		);
	}
}

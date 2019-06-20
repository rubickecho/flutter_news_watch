import 'package:flutter_news_watch/common/config/Config.dart';

class ApiMap {

	///This endpoint provides live top and breaking headlines for a country, specific category in a country, single source, or multiple sources. You can also search with keywords. Articles are sorted by the earliest date published first.
	static getAllHeadLines (category) {
//		return Config.API_BASE_URL + '/v2/top-headlines?country=us&apiKey=cfcab75aa1d1495c94966dae4fd9ea1b';
		return "${Config.API_BASE_URL}/v2/top-headlines?country=us&category=$category&apiKey=${Config.API_KEY}";
	}

	///This endpoint returns the subset of news publishers that top headlines (/v2/top-headlines) are available from. It's mainly a convenience endpoint that you can use to keep track of the publishers available on the API, and you can pipe it straight through to your users.
	static getSources () {
		return Config.API_BASE_URL + '/v2/sources?country=us&apiKey=' + Config.API_KEY;
	}

}

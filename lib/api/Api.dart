import 'package:dio/dio.dart';
import 'dart:collection';
import 'package:flutter_news_watch/api/Code.dart';
import 'package:flutter_news_watch/api/ResultData.dart';
import 'package:flutter_news_watch/common/config/Config.dart';
import 'package:connectivity/connectivity.dart';

class HttpManager {
	static const CONTENT_TYPE_JSON = "application/json";
	static const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";
	static Map optionParams = {
		"timeoutMs": 15000,
		"token": null
	};

	static netFetch(url, params, Map<String, String> header, Options option, {noTip = false}) async {

		//检查网络状态
		var connectivityResult = await (new Connectivity().checkConnectivity());
		if (connectivityResult == ConnectivityResult.none) {
			return new ResultData(Code.errorHandleFunction(Code.NETWORK_ERROR, "", noTip), false, Code.NETWORK_ERROR);
		}

		//设置请求头部
		Map<String, String> headers = new HashMap();
		if (header != null) {
			headers.addAll(headers);
		}

		//设置参数配置
		if (option != null) {
			option.headers = headers;
		} else {
			option = new Options(
				method: "get"
			);
			option.headers = headers;
		}
		print(params.toString());
		option.connectTimeout = 15000;
		Dio dio = new Dio();
		Response response;
		try {
			response = await dio.request(url, data: params, options: option);
		} on DioError catch (e) {
			Response errorResponse;
			if (e.response != null) {
				errorResponse = e.response;
			} else {
				errorResponse = new Response(statusCode: 666);
			}

			if (e.type == DioErrorType.CONNECT_TIMEOUT) {
				errorResponse.statusCode = Code.NETWORK_TIMEOUT;
			}

			if (Config.DEBUG) {
				print('请求url: $url, 异常:' + e.toString());
			}
			return new ResultData(Code.errorHandleFunction(errorResponse.statusCode, e.message, noTip), false, errorResponse.statusCode);
		}

		if (Config.DEBUG) {
			print('-----------Start----------');
			print('请求URL: $url');
			print('请求参数: $params');
			print('返回参数: ' + response.toString());
			print('-----------End----------');
		}

		try {
			if (response.statusCode == 200 || response.statusCode == 201) {
				return new ResultData(response.data, true, Code.SUCCESS, header: response.headers);
			}
		} catch (e) {
			return new ResultData(response.data, false, response.statusCode, header: response.headers);
		}

		return new ResultData(Code.errorHandleFunction(response.statusCode, "", noTip), false, response.statusCode);
	}
}

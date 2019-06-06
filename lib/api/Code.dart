import 'package:event_bus/event_bus.dart';
import 'package:flutter_news_watch/api/HttpErrorEvent.dart';

/// @Author tangliangcheng
/// @Date 2019/4/2
/// @Description Code 错误编码
class Code {
	static const NETWORK_ERROR = -1; //网络错误

	static const NETWORK_TIMEOUT = -2; //网络超时

	static const NETWORK_JSON_EXCEPTION = -3; //网络返回的数据格式化错误

	static const TOKEN_NOT_FOUND = -4; //未设置TOKEN

	static const SUCCESS = 200; //成功

	static final EventBus eventBus = new EventBus();

	static errorHandleFunction(code, message, noTip) {
		if (noTip) {
			return message;
		}
		eventBus.fire(new HttpErrorEvent(code, message));
		String _message;
		switch(code) {
			case NETWORK_ERROR:
				_message = "网络错误";
				break;
			case NETWORK_TIMEOUT:
				_message = "网络超时";
				break;
			default:
				_message = "服务器开小差";

		}
		return {"status": 500, "message": _message, "result": null};
	}
}

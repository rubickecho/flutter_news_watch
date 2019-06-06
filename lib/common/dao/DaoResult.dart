import 'dart:async';

class DataResult {
	var data;
	bool status;
	Future next;

	DataResult(this.status, this.data, {this.next});
}

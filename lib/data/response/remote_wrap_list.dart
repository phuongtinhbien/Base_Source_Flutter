import 'package:expense_tracking/data/response/response_helper.dart';

class RespWrapList<T> {

  List<T> data;
  String message;
  int code;

  RespWrapList();

  factory RespWrapList.fromJson(dynamic map, {T Function(dynamic map) callT}) {
    if (null == map) return null;
    var temp;

    return RespWrapList()
      ..data = ResponseHelper.genericToListObject(map["data"], T).cast<T>().toList()
      ..message = map['message']?.toString()
      ..code = null == (temp = map['code'])
          ? null
          : (temp is num ? temp.toInt() : int.tryParse(temp));
  }

  Map<String, dynamic> toJson() {
    return {
      'data': ResponseHelper.genericToMap(data),
      'message': message,
      'code': code,
    };
  }
}

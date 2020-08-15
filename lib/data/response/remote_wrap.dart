import 'package:expense_tracking/data/response/response_helper.dart';

class RespWrap<T> {
  T data;
  String message;
  int code;

  RespWrap();

  factory RespWrap.fromJson(dynamic map, {T Function(dynamic map) callT}) {
    if (null == map) return null;
    var temp;
    return RespWrap()
      ..data = ResponseHelper.genericToObject(map["data"], T)
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

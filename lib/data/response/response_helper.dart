class ResponseHelper {
  static dynamic genericToObject(dynamic json, Type runTimeType) {
    switch (runTimeType) {
//      case UserTokenModel:
//        return UserTokenModel.fromJson(json);
      ///implement new cast
      default:
        return null;
    }
  }

  static List genericToListObject(dynamic json, Type runTimeType) {
    List data = (json as List)?.map((e) {
      if (e != null) {
        return genericToObject(e, runTimeType);
      } else {
        return null;
      }
    })?.toList();

    return data;
  }

  static dynamic genericToMap(dynamic val) {
    if (null == val) {
      return null;
    } else if (val is num) {
      return val;
    } else if (val is String) {
      return val;
    } else if (val is bool) {
      return val;
    } else if (val is DateTime) {
      return val.toString();
    } else if (val is List) {
      return val.map(genericToMap).toList();
    } else if (val is Map) {
      return val.map(
          (key, value) => MapEntry(genericToMap(key), genericToMap(value)));
    } else if (val is Set) {
      return val.map(genericToMap).toSet();
    }
    try {
      return val?.toMap();
    } catch (e) {
      return val?.index;
    }
  }
}

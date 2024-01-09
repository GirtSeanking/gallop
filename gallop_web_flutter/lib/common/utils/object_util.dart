class ObjectUtil {
  static bool isNotBlank(Object? object) {
    bool isNotNull = object != null;
    return isNotNull;
  }
  static bool isNotEmpty(Object? object) {
    if (isNotBlank(object)) {
      return object.toString().isNotEmpty;
    }
    return false;
  }
}


// inspired by https://medium.com/flutter-community/handling-network-calls-like-a-pro-in-flutter-31bd30c86be1

void throwForStatusCodeIfNecessary(int reportedStatusCode, dynamic bodyString) {

  //final String bodyStringData = utf8.decode(bodyString.runes.toList());
  switch (reportedStatusCode) {
    case 200:
      break;
    case 422:
      throw BadRequestException(bodyString);
    case 400:
      throw BadRequestException(bodyString);
    case 401:
      throw UnauthorisedException(bodyString);
    case 403:
      throw ForbiddenException(bodyString);
    case 409:
      throw InternalException(bodyString);
    case 500:
      throw bodyString;
    default:
      throw InternalException(bodyString);
  }
}

class AppException implements Exception {

  AppException([this._message, this._prefix]);
  final dynamic _message;
  final dynamic _prefix;

  String getMessage() {
    return _message;
  }

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "");
}

class ForbiddenException extends AppException {
  ForbiddenException([message]) : super(message, "");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "");
}

class InternalException extends AppException {
  InternalException([message]) : super(message, "");
}

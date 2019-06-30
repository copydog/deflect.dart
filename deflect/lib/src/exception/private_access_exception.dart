import 'package:deflect/src/exception/deflection_exception.dart';

class PrivateAccessException extends DeflectionException {
  PrivateAccessException([
    String message = "Private field can't be accessed.",
  ]) : super(message);
}

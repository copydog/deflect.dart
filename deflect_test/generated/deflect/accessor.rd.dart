import "package:deflect/src/typedef/accessor.dart";
import "package:deflect_test/src/test_object.dart" as p3;

var sd = {
  "isBase": (o, e) => o.isBase = e,
  "testName": (o, e) => o.testName = e,
  "randomNumber": (o, e) => o.randomNumber = e,
  "field1": (o, e) => o.field1 = e,
  "field2": (o, e) => o.field2 = e,
  "field3": (o, e) => o.field3 = e,
  "field4": (o, e) => o.field4 = e,
  "field9": (o, e) => o.field9 = e
};
var gd = {
  "hashCode": (o) => o.hashCode,
  "runtimeType": (o) => o.runtimeType,
  "isBase": (o) => o.isBase,
  "testName": (o) => o.testName,
  "randomNumber": (o) => o.randomNumber,
  "field1": (o) => o.field1,
  "field2": (o) => o.field2,
  "field3": (o) => o.field3,
  "field4": (o) => o.field4,
  "field8": (o) => o.field8,
  "field9": (o) => o.field9
};
Map<String, Map<Type, Setter>> ssd = {};
Map<String, Map<Type, Getter>> sgd = {
  "field10": {p3.TestObject: (o) => p3.TestObject.field10},
  "field11": {p3.TestObject: (o) => p3.TestObject.field11}
};

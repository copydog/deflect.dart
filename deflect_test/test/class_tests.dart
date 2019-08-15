import 'package:deflect/deflect.dart';
import 'package:deflect_test/src/test_object.dart';
import 'package:test/test.dart';
import '../generated/deflect/deflect.dart';

void main() {
  group("Class Tests", () {
    setUpAll(() {
      initDeflect();
    });

    test("All appeared class is deflected", () {
      // Object
      expect(deflect<Object>(), isA<Class<Object>>());
      expect(deflect<int>(), isA<Class<int>>());
      expect(deflect<double>(), isA<Class<double>>());
      expect(deflect<num>(), isA<Class<num>>());
      expect(deflect<bool>(), isA<Class<bool>>());
      expect(deflect<String>(), isA<Class<String>>());
      expect(deflect<TestObject>(), isA<Class<TestObject>>());
    });

    test("No duplicate class generated", () {
      Object obj = Object();
      Class<Object> objectClass = deflect(obj);
      Class<Object> objectClass2 = deflect<Object>();
      expect(objectClass, objectClass2);
    });
  });
}

import 'package:deflect/deflect.dart';
import 'package:test/test.dart';
import 'package:deflect_test/generated/entry.deflect.dart';

void main() {
  group('Field Tests', () {
    setUpAll(() {
      initDeflect();
    });

    test("Object fields", () {
      Object obj = new Object();
      Class<Object> objectClass = deflect(obj);
      expect(objectClass.getFields(), hasLength(2));
      Field hashCodeField = objectClass.getField("hashCode");
      expect(hashCodeField, isNotNull);
      expect(hashCodeField.getName(), "hashCode");
      expect(hashCodeField.get(obj), isA<int>());
      expect(hashCodeField.getInt(obj), isA<int>());
      expect(() => hashCodeField.getBoolean(obj), throws);
      expect(() => hashCodeField.getDouble(obj), throws);
      expect(hashCodeField.getNum(obj), isA<int>());
      expect(hashCodeField.getDeclaringClass(), objectClass);
//      expect(hashCodeField.getType(), objectClass);
      int hashCodeModifiers = hashCodeField.getModifiers();
      expect(Modifier.isPublic(hashCodeModifiers), isTrue);
//      expect(Modifier.isExternal(modifiers), isTrue);
    });

    test("All appeared class is deflected", () {
      // Object
      expect(deflect(Object), isA<Class<Object>>());
      expect(deflect(int), isA<Class<int>>());
      expect(deflect(double), isA<Class<double>>());
      expect(deflect(num), isA<Class<num>>());
      expect(deflect(bool), isA<Class<bool>>());
      expect(deflect(String), isA<Class<String>>());
    });

    test("TestObject fields", () {});
  });
}

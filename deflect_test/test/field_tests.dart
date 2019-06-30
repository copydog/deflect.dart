import 'package:deflect/deflect.dart';
import 'package:deflect_test/src/test_object.dart';
import 'package:test/test.dart';
import 'package:deflect_test/generated/entry.deflect.dart';

void main() {
  group('Field Tests', () {
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
    });

    test("No duplicate class generated", () {
      Object obj = new Object();
      Class<Object> objectClass = deflect(obj);
      Class<Object> objectClass2 = deflect<Object>();
      expect(objectClass, objectClass2);
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

    test("TestObject fields", () {
      TestObject obj = TestObject();
      var testObjectClass = deflect(obj);
      expect(testObjectClass, isA<Class<TestObject>>());
      // Object related fields
      expect(testObjectClass.getField("hashCode"), isNotNull);
      expect(testObjectClass.getField("runtimeType"), isNotNull);
      List<Field> fields = testObjectClass.getFields();
      List<Field> declaredFields = testObjectClass.getDeclaredFields();
      // field count
      expect(declaredFields, hasLength(9));
//      expect(fields, hasLength(matcher))
      expect(fields, hasLength(8));

      /// field1 field tests
      Field field1 = testObjectClass.getField("field1");
      expect(field1.getType(), deflect<int>());
      int field1Modifiers = field1.getModifiers();
      expect(field1.getInt(obj), 0);
      expect(field1Modifiers, Modifier.PUBLIC);
      expect(field1.getName(), "field1");
      expect(field1.getDeclaringClass(), testObjectClass);
      expect(field1.isEnumConstant(), isFalse);
      expect(field1.isSynthetic(), isFalse);
      field1.setInt(obj, 1);
      expect(obj.field1, 1);

      /// field2 field tests
      Field field2 = testObjectClass.getField("field2");
      expect(field2.getType(), deflect<double>());
      int field2Modifiers = field2.getModifiers();
      expect(field2.getDouble(obj), 0.0);
      expect(field2Modifiers, Modifier.PUBLIC);
      expect(field2.getName(), "field2");
      expect(field2.getDeclaringClass(), testObjectClass);
      expect(field2.isEnumConstant(), isFalse);
      expect(field2.isSynthetic(), isFalse);
      field2.setDouble(obj, 1.0);
      expect(obj.field2, 1.0);

      /// field3 field tests
      Field field3 = testObjectClass.getField("field3");
      expect(field3.getType(), deflect<num>());
      int field3Modifiers = field3.getModifiers();
      expect(field3.getNum(obj), 0.0);
      expect(field3Modifiers, Modifier.PUBLIC);
      expect(field3.getName(), "field3");
      expect(field3.getDeclaringClass(), testObjectClass);
      expect(field3.isEnumConstant(), isFalse);
      expect(field3.isSynthetic(), isFalse);
      field3.setNum(obj, 1.0);
      expect(obj.field3, 1.0);

      /// field4 field tests
      Field field4 = testObjectClass.getField("field4");
      expect(field4.getType(), deflect<bool>());
      int field4Modifiers = field4.getModifiers();
      expect(field4.getBoolean(obj), isFalse);
      expect(field4Modifiers, Modifier.PUBLIC);
      expect(field4.getName(), "field4");
      expect(field4.getDeclaringClass(), testObjectClass);
      expect(field4.isEnumConstant(), isFalse);
      expect(field4.isSynthetic(), isFalse);
      field4.setBoolean(obj, true);
      expect(obj.field4, isTrue);

      /// field5 field tests
      Field _field5 = testObjectClass.getField("_field5");
      expect(_field5, isNull);
      Field field5 = testObjectClass.getDeclaredField("_field5");
      int field5Modifiers = field5.getModifiers();
      expect(
        () => field5.getBoolean(obj),
        throwsA(isA<PrivateAccessException>()),
      );
      expect(field5Modifiers, Modifier.PRIVATE);
      expect(field5.getName(), "_field5");
      expect(field5.getDeclaringClass(), testObjectClass);
      expect(field5.isEnumConstant(), isFalse);
      expect(field5.isSynthetic(), isFalse);
      expect(
        () => field5.setBoolean(obj, true),
        throwsA(isA<PrivateAccessException>()),
      );
//      expect(obj.field5, isTrue);
    });
  });
}

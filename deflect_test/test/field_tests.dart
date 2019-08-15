import 'package:deflect/deflect.dart';
import 'package:deflect_test/src/test_object.dart';
import 'package:test/test.dart';
import '../generated/deflect/deflect.dart';

void main() {
  group('Field Tests', () {
    setUpAll(() {
      initDeflect();
    });

    test("fields", () {
      Object obj = Object();
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

    test("modifiers", () {
      TestObject obj = TestObject();
      var objClass = deflect(obj);
      int field1modifiers = objClass.getField("field1").getModifiers();
      expect(field1modifiers, Modifier.PUBLIC);
      int field2modifiers = objClass.getField("field2").getModifiers();
      expect(field2modifiers, Modifier.PUBLIC);
      int field3modifiers = objClass.getField("field3").getModifiers();
      expect(field3modifiers, Modifier.PUBLIC);
      int field4modifiers = objClass.getField("field4").getModifiers();
      expect(field4modifiers, Modifier.PROTECTED | Modifier.PUBLIC);
      int field5modifiers = objClass.getDeclaredField("_field5").getModifiers();
      expect(field5modifiers, Modifier.PRIVATE);
      int field6modifiers = objClass.getDeclaredField("_field6").getModifiers();
      expect(field6modifiers, Modifier.PRIVATE);
      int field7modifiers = objClass.getDeclaredField("_field7").getModifiers();
      expect(field7modifiers, Modifier.PRIVATE);
      int field8modifiers = objClass.getField("field8").getModifiers();
      expect(field8modifiers, Modifier.PUBLIC | Modifier.FINAL);
      int field9modifiers = objClass.getField("field9").getModifiers();
      expect(field9modifiers, Modifier.PUBLIC);
      int field10modifiers = objClass.getField("field10").getModifiers();
      expect(
        field10modifiers,
        Modifier.PUBLIC | Modifier.STATIC | Modifier.FINAL,
      );
      int field11modifiers = objClass.getField("field11").getModifiers();
      expect(
        field11modifiers,
        Modifier.PUBLIC | Modifier.STATIC | Modifier.CONST,
      );
    });

    test("is", () {
      TestObject obj = TestObject();
      var objClass = deflect(obj);
      Field field1 = objClass.getField("field1");
      expect(field1.isEnumConstant(), false);
      expect(field1.isSynthetic(), false);
      Field field2 = objClass.getField("field2");
      expect(field2.isEnumConstant(), false);
      expect(field2.isSynthetic(), false);
      Field field3 = objClass.getField("field3");
      expect(field3.isEnumConstant(), false);
      expect(field3.isSynthetic(), false);
      Field field4 = objClass.getField("field4");
      expect(field4.isEnumConstant(), false);
      expect(field4.isSynthetic(), false);
      Field field5 = objClass.getDeclaredField("_field5");
      expect(field5.isEnumConstant(), false);
      expect(field5.isSynthetic(), false);
      Field field6 = objClass.getDeclaredField("_field6");
      expect(field6.isEnumConstant(), false);
      expect(field6.isSynthetic(), false);
      Field field7 = objClass.getDeclaredField("_field7");
      expect(field7.isEnumConstant(), false);
      expect(field7.isSynthetic(), false);
      Field field8 = objClass.getField("field8");
      expect(field8.isEnumConstant(), false);
      expect(field8.isSynthetic(), true);
      Field field9 = objClass.getField("field9");
      expect(field9.isEnumConstant(), false);
      expect(field9.isSynthetic(), true);
      Field field10 = objClass.getField("field10");
      expect(field10.isEnumConstant(), false);
      expect(field10.isSynthetic(), false);
      Field field11 = objClass.getField("field11");
      expect(field11.isEnumConstant(), false);
      expect(field11.isSynthetic(), false);
    });

    test("get", () {
      TestObject obj = TestObject();
      var objClass = deflect(obj);
      Field field1 = objClass.getField("field1");
      expect(field1.get(obj), 0);
      expect(field1.getInt(obj), 0);
      Field field2 = objClass.getField("field2");
      expect(field2.get(obj), 0.0);
      expect(field2.getDouble(obj), 0.0);
      Field field3 = objClass.getField("field3");
      expect(field3.get(obj), 0.0);
      expect(field3.getDouble(obj), 0.0);
      Field field4 = objClass.getField("field4");
      expect(field4.get(obj), false);
      expect(field4.getBoolean(obj), false);
      Field field5 = objClass.getDeclaredField("_field5");
      expect(
        () => field5.get(obj),
        throwsA(isA<PrivateAccessException>()),
      );
      Field field6 = objClass.getDeclaredField("_field6");
      expect(
        () => field6.get(obj),
        throwsA(isA<PrivateAccessException>()),
      );
      Field field7 = objClass.getDeclaredField("_field7");
      expect(
        () => field7.get(obj),
        throwsA(isA<PrivateAccessException>()),
      );
      Field field8 = objClass.getField("field8");
      expect(field8.get(obj), equals({}));
      Field field9 = objClass.getField("field9");
      expect(field9.get(obj), equals([]));
      Field field10 = objClass.getField("field10");
      expect(field10.get(TestObject), 0);
      expect(field10.getInt(TestObject), 0);
      Field field11 = objClass.getField("field11");
      expect(field11.get(TestObject), 0);
      expect(field11.getInt(TestObject), 0);
    });

    test("set", () {
      TestObject obj = TestObject();
      var objClass = deflect(obj);
      Field field1 = objClass.getField("field1");
      field1.set(obj, 1);
      expect(obj.field1, 1);
      Field field2 = objClass.getField("field2");
      field2.set(obj, 1.0);
      expect(obj.field2, 1.0);
      Field field3 = objClass.getField("field3");
      field3.set(obj, 1.0);
      expect(obj.field3, 1.0);
      Field field4 = objClass.getField("field4");
      field4.set(obj, true);
      expect(obj.field4, true);
      Field field5 = objClass.getDeclaredField("_field5");
      expect(
        () => field5.set(obj, null),
        throwsA(isA<PrivateAccessException>()),
      );
      Field field6 = objClass.getDeclaredField("_field6");
      expect(
        () => field6.set(obj, null),
        throwsA(isA<PrivateAccessException>()),
      );
      Field field7 = objClass.getDeclaredField("_field7");
      expect(
        () => field7.set(obj, null),
        throwsA(isA<PrivateAccessException>()),
      );
      Field field8 = objClass.getField("field8");
      field8.set(obj, true);
      expect(obj.field8, {});
      Field field9 = objClass.getField("field9");
      field9.set(obj, <double>[]);
      expect(obj.field9, []);
      Field field10 = objClass.getField("field10");
      field10.set(TestObject, 1);
      expect(TestObject.field10, 0);
      Field field11 = objClass.getField("field11");
      field11.set(TestObject, 1);
      expect(TestObject.field11, 0);
    });

//    test("TestObject fields", () {
//      TestObject obj = TestObject();
//      var testObjectClass = deflect(obj);
//      expect(testObjectClass, isA<Class<TestObject>>());
//      // Object related fields
//      expect(testObjectClass.getField("hashCode"), isNotNull);
//      expect(testObjectClass.getField("runtimeType"), isNotNull);
//      List<Field> fields = testObjectClass.getFields();
//      List<Field> declaredFields = testObjectClass.getDeclaredFields();
//      // field count
//      expect(declaredFields, hasLength(11));
////      expect(fields, hasLength(matcher))
//      expect(fields, hasLength(10));
//
//      /// field1 field tests
//      Field field1 = testObjectClass.getField("field1");
//      expect(field1.getType(), deflect<int>());
//      int field1Modifiers = field1.getModifiers();
//      expect(field1.getInt(obj), 0);
//      expect(field1Modifiers, Modifier.PUBLIC);
//      expect(field1.getName(), "field1");
//      expect(field1.getDeclaringClass(), testObjectClass);
//      expect(field1.isEnumConstant(), isFalse);
//      expect(field1.isSynthetic(), isFalse);
//      field1.setInt(obj, 1);
//      expect(obj.field1, 1);
//
//      /// field2 field tests
//      Field field2 = testObjectClass.getField("field2");
//      expect(field2.getType(), deflect<double>());
//      int field2Modifiers = field2.getModifiers();
//      expect(field2.getDouble(obj), 0.0);
//      expect(field2Modifiers, Modifier.PUBLIC);
//      expect(field2.getName(), "field2");
//      expect(field2.getDeclaringClass(), testObjectClass);
//      expect(field2.isEnumConstant(), isFalse);
//      expect(field2.isSynthetic(), isFalse);
//      field2.setDouble(obj, 1.0);
//      expect(obj.field2, 1.0);
//
//      /// field3 field tests
//      Field field3 = testObjectClass.getField("field3");
//      expect(field3.getType(), deflect<num>());
//      int field3Modifiers = field3.getModifiers();
//      expect(field3.getNum(obj), 0.0);
//      expect(field3Modifiers, Modifier.PUBLIC);
//      expect(field3.getName(), "field3");
//      expect(field3.getDeclaringClass(), testObjectClass);
//      expect(field3.isEnumConstant(), isFalse);
//      expect(field3.isSynthetic(), isFalse);
//      field3.setNum(obj, 1.0);
//      expect(obj.field3, 1.0);
//
//      /// field4 field tests
//      Field field4 = testObjectClass.getField("field4");
//      expect(field4.getType(), deflect<bool>());
//      int field4Modifiers = field4.getModifiers();
//      expect(field4.getBoolean(obj), isFalse);
//      expect(field4Modifiers, Modifier.PROTECTED);
//      expect(field4.getName(), "field4");
//      expect(field4.getDeclaringClass(), testObjectClass);
//      expect(field4.isEnumConstant(), isFalse);
//      expect(field4.isSynthetic(), isFalse);
//      field4.setBoolean(obj, true);
//      expect(obj.field4, isTrue);
//
//      /// field5 field tests
//      Field _field5 = testObjectClass.getField("_field5");
//      expect(_field5, isNull);
//      Field field5 = testObjectClass.getDeclaredField("_field5");
//      expect(field5.getType(), deflect<String>());
//      int field5Modifiers = field5.getModifiers();
//      expect(
//        () => field5.getBoolean(obj),
//        throwsA(isA<PrivateAccessException>()),
//      );
//      expect(field5Modifiers, Modifier.PRIVATE);
//      expect(field5.getName(), "_field5");
//      expect(field5.getDeclaringClass(), testObjectClass);
//      expect(field5.isEnumConstant(), isFalse);
//      expect(field5.isSynthetic(), isFalse);
//      expect(
//        () => field5.setBoolean(obj, true),
//        throwsA(isA<PrivateAccessException>()),
//      );
//
//      /// field6 field tests
//      Field _field6 = testObjectClass.getField("_field6");
//      expect(_field6, isNull);
//      Field field6 = testObjectClass.getDeclaredField("_field6");
////      expect(field6.getType(), deflect<Object>());
//      int field6Modifiers = field6.getModifiers();
//      expect(
//        () => field6.getBoolean(obj),
//        throwsA(isA<PrivateAccessException>()),
//      );
//      expect(field6Modifiers, Modifier.PRIVATE);
//      expect(field6.getName(), "_field6");
//      expect(field6.getDeclaringClass(), testObjectClass);
//      expect(field6.isEnumConstant(), isFalse);
//      expect(field6.isSynthetic(), isFalse);
//      expect(
//        () => field6.setBoolean(obj, true),
//        throwsA(isA<PrivateAccessException>()),
//      );
//
//      /// field7 field tests
//      Field _field7 = testObjectClass.getField("_field7");
//      expect(_field7, isNull);
//      Field field7 = testObjectClass.getDeclaredField("_field7");
//      expect(field7.getType(), deflect<Object>());
//      int field7Modifiers = field7.getModifiers();
//      expect(
//        () => field7.getBoolean(obj),
//        throwsA(isA<PrivateAccessException>()),
//      );
//      expect(field7Modifiers, Modifier.PRIVATE);
//      expect(field7.getName(), "_field7");
//      expect(field7.getDeclaringClass(), testObjectClass);
//      expect(field7.isEnumConstant(), isFalse);
//      expect(field7.isSynthetic(), isFalse);
//      expect(
//        () => field7.setBoolean(obj, true),
//        throwsA(isA<PrivateAccessException>()),
//      );
//
////      /// field8 field tests
////      Field field8 = testObjectClass.getDeclaredField("field8");
//////      expect(field8.getType(), deflect<Object>());
////      int field8Modifiers = field8.getModifiers();
////      expect(
////        () => field8.get(obj),
////        throwsA(isA<PrivateAccessException>()),
////      );
////      expect(field8Modifiers, Modifier.PRIVATE);
////      expect(field8.getName(), "field8");
////      expect(field8.getDeclaringClass(), testObjectClass);
////      expect(field8.isEnumConstant(), isFalse);
////      expect(field8.isSynthetic(), isFalse);
////      expect(
////        () => field8.set(obj, {}),
////        throwsA(isA<PrivateAccessException>()),
////      );
//    });
  });
}

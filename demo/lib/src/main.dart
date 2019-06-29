import 'package:demo/generated/entry.deflect.dart';
import 'package:demo/src/demo_base.dart';
import 'package:deflect/deflect.dart';

void main() {
  initDeflect();

  Awesome1 awesome1 = Awesome1();
  awesome1.field1 = "hi1";
  Class<Awesome1> awesomeClass = deflect(awesome1);
  print("Class: $awesomeClass");
  List<Field> fields = awesomeClass.getFields();
  Field field1Field = awesomeClass.getField("field1");
  assert(!field1Field.isEnumConstant());
  print("Field value of first: ${fields.first.get(awesome1)}");
  print("Field value of field1: ${awesomeClass.getField("field1").get(awesome1)}");
  field1Field.set(awesome1, "hi2");
  assert(awesome1.field1 == "hi2");
  print("Field declaring class: ${fields.first.getDeclaringClass()}");
  assert(fields.first.getDeclaringClass() == awesomeClass);
  print("Field type: ${fields.first.getType()}");
  print("Field toString: ${fields.first.toString()}");
  assert(awesomeClass.getField("field6").isSynthetic());
  assert(Modifier.isPublic(awesomeClass.getField("field6").getModifiers()));
}

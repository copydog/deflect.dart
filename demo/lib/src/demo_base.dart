import 'package:demo/src/class2.dart';
import 'package:demo/src/interface1.dart';
import 'package:demo/src/interface3.dart';

class Awesome1 extends Class2 implements Interface1 {
  String field1;
  int field2;
  bool _field3;
  double _field4;
  Type field5;
  List<Map> field6;

  @override
  void interface1Method() {}

  @override
  int interface1Field;
}

class Awesome2<T> implements Interface3 {
  String field11;
  int field12;
  bool _field13;
  double _field14;
  Type field15;
  List<Map> field16;

  @override
  String interface3Field;

  @override
  void interface3Method() {}
}

void awesome3() {}

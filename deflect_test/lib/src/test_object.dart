import 'package:meta/meta.dart';

class TestObject {
  int field1 = 0;
  double field2 = 0.0;
  num field3 = 0.0;
  @protected
  bool field4 = false;
  String _field5 = "";
  dynamic _field6 = 0;
  Object _field7 = Object();
  Map<int, int> get field8 => {};
  List<double> get field9 => [];
  set field9(List<double> val) => null;
  static final int field10 = 0;
  static const int field11 = 0;
}

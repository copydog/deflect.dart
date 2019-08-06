import 'package:deflect_generator/src/util/code_utils.dart';
import 'package:test/test.dart';

void main() {
  group("CodeUtils Tests", () {
    test(".getCodeFromMap", () {
      String result =
          CodeUtils.getCodeFromMap({1: 1, 2: "2", 3: true, 4: 4.0, 5: {}});
      expect(result, "{1:1,2:\"2\",3:true,4:4.0,5:{}}");
    });

    test(".getCodeFromList", () {
      String result = CodeUtils.getCodeFromList([1, 2.0, true, "4", []]);
      expect(result, "[1,2.0,true,\"4\",[]]");
    });

    test("nested code generation", () {
      String result = CodeUtils.getCodeFromMap({
        1: 1,
        2: "2",
        3: true,
        4: 4.0,
        5: [1, 2.0, true, "4", []],
      });
      expect(result, "{1:1,2:\"2\",3:true,4:4.0,5:[1,2.0,true,\"4\",[]]}");
    });
  });
}

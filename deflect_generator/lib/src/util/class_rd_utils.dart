import 'package:analyzer/dart/element/element.dart';
import 'package:deflect_generator/src/reflection/class_rd.dart';
import 'package:deflect_generator/src/util/class_field_rd_utils.dart';

/// ClassRD Utils
abstract class ClassRDUtils {
  /// generate ClassRD from ClassElement
  static ClassRd createFromClassElement(ClassElement element) {
    ClassRd classRD = new ClassRd(
      privateFields: element.fields
          .where((e) => e.isPrivate)
          .map(ClassFieldRdUtils.createFromFieldElement)
          .toList(),
      publicFields: element.fields
          .where((e) => !e.isPrivate)
          .map(ClassFieldRdUtils.createFromFieldElement)
          .toList(),
    );

    // parse fields

    return classRD;
  }
}

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:deflect_generator/src/collector/class_collector.dart';
import 'package:deflect_generator/src/manager/accessor_dict_manager.dart';
import 'package:deflect_generator/src/manager/class_dict_manager.dart';
import 'package:deflect_generator/src/manager/string_dict_manager.dart';
import 'package:deflect_generator/src/template/class_reflection_data.dart';
import 'package:source_gen/source_gen.dart';

class ClassBuilder extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) {
    List<ClassElement> classes = List<ClassElement>.from(
      library.allElements.where((e) => e is ClassElement),
    );

    for (ClassElement class_ in classes) {
      ClassCollector.collect(class_);
    }

    print(ClassDictManager.getTemplate());
    print(StringDictManager.getTemplate());
    print(AccessorDictManager.getTemplate());

    return null;
  }
}

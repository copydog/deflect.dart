import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:deflect_generator/src/collector/class_collector.dart';
import 'package:source_gen/source_gen.dart';

class ClassBuilder extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) {
    List<ClassElement> classes = List<ClassElement>.from(
      library.allElements.where((e) => e is ClassElement),
    );

    for (ClassElement class_ in classes) {
      ClassCollector.collect(class_);
//      print(class_.supertype.element);
      ClassCollector.collect(class_.supertype.element);
    }

    return null;
  }
}

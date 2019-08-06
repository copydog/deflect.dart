import 'package:build/build.dart';
import 'package:deflect_generator/src/renderer/class_rd_renderer.dart';
import 'package:source_gen/source_gen.dart';

class PostBuilder extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) {
    ClassRdRenderer.render();
  }
}

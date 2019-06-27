import 'package:build/build.dart';
import 'package:deflect_generator/src/renderer/field_getter_dict_renderer.dart';
import 'package:deflect_generator/src/renderer/class_dict_renderer.dart';
import 'package:deflect_generator/src/renderer/class_reflection_data_renderer.dart';
import 'package:deflect_generator/src/renderer/entry_renderer.dart';
import 'package:deflect_generator/src/renderer/string_dict_renderer.dart';
import 'package:source_gen/source_gen.dart';

class PostBuilder extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) {
    ClassDictRenderer.render();
    StringDictRenderer.render();
    FieldGetterDictRenderer.render();
    ClassReflectionDataRenderer.render();
    EntryRenderer.render();
  }
}

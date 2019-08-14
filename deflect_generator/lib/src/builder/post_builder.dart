import 'dart:io';

import 'package:build/build.dart';
import 'package:deflect_generator/src/renderer/class_rd_renderer.dart';
import 'package:deflect_generator/src/renderer/initializer_renderer.dart';
import 'package:deflect_generator/src/renderer/shared_utils_render.dart';
import 'package:source_gen/source_gen.dart';

class PostBuilder extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) {
    // initialize folder
    Directory containingFolder = Directory("generated/deflect/");
    if (!containingFolder.existsSync()) {
      containingFolder.createSync(recursive: true);
    }

    SharedUtilsRender.render();
    ClassRdRenderer.render();
    InitializerRenderer.render();
  }
}

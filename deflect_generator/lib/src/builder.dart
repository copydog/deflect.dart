import 'package:build/build.dart';
import 'package:deflect_generator/src/builder/class_builder.dart';
import 'package:deflect_generator/src/builder/post_builder.dart';
import 'package:source_gen/source_gen.dart';

Builder defaultBuilder(BuilderOptions options) => SharedPartBuilder(
      [
        ClassBuilder(),
        PostBuilder(),
      ],
      'deflection_builder',
    );

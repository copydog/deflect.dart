import "field_accessor_dict.deflect.dart";
import "class_dict.deflect.dart";
import "string_dict.deflect.dart";
import "reflection_data.deflect.dart";
import "package:deflect/src/reflection_data/reflection_data_manager.dart";

void initDeflect() {
   ReflectionDataManager.load(
    cd,
    sd,
    fgd,
    fsd,
    rd,
  );
}
    
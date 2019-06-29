import "field_accessor_dict.deflect.dart";
import "type_dict.deflect.dart";
import "string_dict.deflect.dart";
import "reflection_data.deflect.dart";
import "package:deflect/src/reflection_data/reflection.dart";

void initDeflect() {
   Reflection.load(
    cd,
    sd,
    fgd,
    fsd,
    rd,
  );
}
    
void main() {}

bool isTypeOf<ThisType, OfType>() => _Instance<ThisType>() is _Instance<OfType>;
bool isTypeOf2<OfType>(Object obj) => obj is _Instance<OfType>;

class _Instance<T> {
  //
}

void objectToGeneric<T>(T t) => printType<T>();

void printType<T>() => print(T);

class Type {}

class A<T> {}

class B extends A {}

void main() {}

var fa = Function.apply;

getter(i) => i.field;
setter(i, d) => i.field = d;
accessor(i, [d]) => i.field = d ?? i.field;

bool isTypeOf<ThisType, OfType>() => _Instance<ThisType>() is _Instance<OfType>;
bool isTypeOf2<OfType>(Object obj) => obj is _Instance<OfType>;

class _Instance<T> {
  //
}

void objectToGeneric<T>(T t) => printType<T>();

void printType<T>() => print(T);

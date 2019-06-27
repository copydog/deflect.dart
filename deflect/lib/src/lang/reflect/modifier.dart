class Modifier {
  static final int PUBLIC = 0x00000001;

  static final int PRIVATE = 0x00000002;

  static final int PROTECTED = 0x00000004;

  static final int STATIC = 0x00000008;

  static final int FINAL = 0x00000010;

  static final int CONST = 0x00000020;

  static final int ASYNC = 0x00000040;

  static final int GENERATOR = 0x00000080;

  static final int EXTERNAL = 0x00000100;

  static final int ABSTRACT = 0x00000200;

  static bool isPublic(int mod) {
    return (mod & PUBLIC) != 0;
  }

  static bool isPrivate(int mod) {
    return (mod & PRIVATE) != 0;
  }

  static bool isProtected(int mod) {
    return (mod & PROTECTED) != 0;
  }

  static bool isStatic(int mod) {
    return (mod & STATIC) != 0;
  }

  static bool isConst(int mod) {
    return (mod & CONST) != 0;
  }

  static bool isAsync(int mod) {
    return (mod & ASYNC) != 0;
  }

  static bool isGenerator(int mod) {
    return (mod & GENERATOR) != 0;
  }

  static bool isExternal(int mod) {
    return (mod & EXTERNAL) != 0;
  }

  static bool isFinal(int mod) {
    return (mod & FINAL) != 0;
  }

  static bool isAbstract(int mod) {
    return (mod & ABSTRACT) != 0;
  }

  static String toPrefixString(int mod, [bool isClass = false]) {
    StringBuffer sb = new StringBuffer();
    int len;

    /* Canonical order */
    if (isClass && (mod & ABSTRACT) != 0) sb.write("abstract ");
    if ((mod & STATIC) != 0) sb.write("static ");
    if ((mod & FINAL) != 0) sb.write("final ");
    if ((mod & CONST) != 0) sb.write("const ");
    if ((mod & EXTERNAL) != 0) sb.write("externalwe ");

    if ((len = sb.length) > 0) /* trim trailing space */
      return sb.toString().substring(0, len - 1);
    return "";
  }

  static String toSuffixString(int mod) {
    StringBuffer sb = new StringBuffer();

    /* Canonical order */
    if ((mod & ASYNC) != 0 && (mod & GENERATOR) != 0) sb.write(" async*");
    if ((mod & ASYNC) == 0 && (mod & GENERATOR) != 0) sb.write(" sync*");

    return sb.length > 0 ? sb.toString() : "";
  }

  static int classModifiers() {
    return Modifier.PUBLIC | Modifier.PROTECTED | Modifier.PRIVATE | Modifier.ABSTRACT;
  }

  static int constructorModifiers() {
    return Modifier.PUBLIC | Modifier.PROTECTED | Modifier.PRIVATE | Modifier.CONST;
  }

  static int methodModifiers() {
    return Modifier.PUBLIC |
        Modifier.PROTECTED |
        Modifier.PRIVATE |
        Modifier.ABSTRACT |
        Modifier.STATIC |
        Modifier.EXTERNAL;
  }

  static int fieldModifiers() {
    return Modifier.PUBLIC |
        Modifier.PROTECTED |
        Modifier.PRIVATE |
        Modifier.STATIC |
        Modifier.FINAL |
        Modifier.CONST;
  }

  static int parameterModifiers() {
    return Modifier.FINAL;
  }
}

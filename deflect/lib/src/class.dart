import 'lang/annotation/annotation.dart';
import 'lang/reflect/annotated_element.dart';
import 'lang/reflect/annotated_element.dart';
import 'lang/reflect/constructor.dart';
import 'lang/reflect/field.dart';
import 'lang/reflect/method.dart';
import 'lang/reflection_data/ReflectionDataManager.dart';

class Class<T> implements AnnotatedElement {
  static final int ANNOTATION = 0x00002000;
  static final int ENUM = 0x00004000;
  static final int SYNTHETIC = 0x00001000;

  int _classId;

  T t1;

  Class([T obj]) {
    _classId = ReflectionDataManager.getClassId(T);
  }

  /**
   * Converts the object to a string. The string representation is the
   * string "class" or "interface", followed by a space, and then by the
   * fully qualified name of the class in the format returned by
   * {@code getName}.  If this {@code Class} object represents a
   * primitive type, this method returns the name of the primitive type.  If
   * this {@code Class} object represents void this method returns
   * "void".
   *
   * @return a string representation of this class object.
   */
  String toString() {
    return (isInterface() ? "interface " : (isPrimitive() ? "" : "class "))
        + getName();
  }

  /**
   * Returns a string describing this {@code Class}, including
   * information about modifiers and type parameters.
   *
   * The string is formatted as a list of type modifiers, if any,
   * followed by the kind of type (empty string for primitive types
   * and {@code class}, {@code enum}, {@code interface}, or
   * <code>&#64;</code>{@code interface}, as appropriate), followed
   * by the type's name, followed by an angle-bracketed
   * comma-separated list of the type's type parameters, if any.
   *
   * A space is used to separate modifiers from one another and to
   * separate any modifiers from the kind of type. The modifiers
   * occur in canonical order. If there are no type parameters, the
   * type parameter list is elided.
   *
   * <p>Note that since information about the runtime representation
   * of a type is being generated, modifiers not present on the
   * originating source code or illegal on the originating source
   * code may be present.
   *
   * @return a string describing this {@code Class}, including
   * information about modifiers and type parameters
   *
   * @since 1.8
   */
  String toGenericString() {
    if (isPrimitive()) {
      return toString();
    } else {
      StringBuffer sb = new StringBuffer();

      // Class modifiers are a superset of interface modifiers
      int modifiers = getModifiers() & Modifier.classModifiers();
      if (modifiers != 0) {
        sb.write(Modifier.toString(modifiers));
        sb.write(' ');
      }

      if (isAnnotation()) {
        sb.write('@');
      }
      if (isInterface()) { // Note: all annotation types are interfaces
        sb.write("interface");
      } else {
        if (isEnum())
          sb.write("enum");
        else
          sb.write("class");
      }
      sb.write(' ');
      sb.write(getName());

      TypeVariable<?>[] typeparms = getTypeParameters();
    if (typeparms.length > 0) {
        boolean first = true;
        sb.append('<');
        for(TypeVariable typeparm in typeparms) {
        if (!first)
        sb.append(',');
        sb.append(typeparm.getTypeName());
        first = false;
      }
      sb.append('>');
    }

    return sb.toString();
  }
  }

  /**
   * Returns the {@code Class} object associated with the class or
   * interface with the given string name.  Invoking this method is
   * equivalent to:
   *
   * <blockquote>
   *  {@code Class.forName(className, true, currentLoader)}
   * </blockquote>
   *
   * where {@code currentLoader} denotes the defining class loader of
   * the current class.
   *
   * <p> For example, the following code fragment returns the
   * runtime {@code Class} descriptor for the class named
   * {@code java.lang.Thread}:
   *
   * <blockquote>
   *   {@code Class t = Class.forName("java.lang.Thread")}
   * </blockquote>
   * <p>
   * A call to {@code forName("X")} causes the class named
   * {@code X} to be initialized.
   *
   * @param      className   the fully qualified name of the desired class.
   * @return     the {@code Class} object for the class with the
   *             specified name.
   * @exception LinkageError if the linkage fails
   * @exception ExceptionInInitializerError if the initialization provoked
   *            by this method fails
   * @exception ClassNotFoundException if the class cannot be located
   */
  static Class forName(String className) {
    // TODO
  }

  /**
   * Creates a new instance of the class represented by this {@code Class}
   * object.  The class is instantiated as if by a {@code new}
   * expression with an empty argument list.  The class is initialized if it
   * has not already been initialized.
   *
   * <p>Note that this method propagates any exception thrown by the
   * nullary constructor, including a checked exception.  Use of
   * this method effectively bypasses the compile-time exception
   * checking that would otherwise be performed by the compiler.
   * The {@link
   * java.lang.reflect.Constructor#newInstance(java.lang.Object...)
   * Constructor.newInstance} method avoids this problem by wrapping
   * any exception thrown by the constructor in a (checked) {@link
   * java.lang.reflect.InvocationTargetException}.
   *
   * @return  a newly allocated instance of the class represented by this
   *          object.
   * @throws  IllegalAccessException  if the class or its nullary
   *          constructor is not accessible.
   * @throws  InstantiationException
   *          if this {@code Class} represents an abstract class,
   *          an interface, an array class, a primitive type, or void;
   *          or if the class has no nullary constructor;
   *          or if the instantiation fails for some other reason.
   * @throws  ExceptionInInitializerError if the initialization
   *          provoked by this method fails.
   * @throws  SecurityException
   *          If a security manager, <i>s</i>, is present and
   *          the caller's class loader is not the same as or an
   *          ancestor of the class loader for the current class and
   *          invocation of {@link SecurityManager#checkPackageAccess
   *          s.checkPackageAccess()} denies access to the package
   *          of this class.
   */
  T newInstance() {
    // TODO
  }

  /**
   * Determines if the specified {@code Object} is assignment-compatible
   * with the object represented by this {@code Class}.  This method is
   * the dynamic equivalent of the Java language {@code instanceof}
   * operator. The method returns {@code true} if the specified
   * {@code Object} argument is non-null and can be cast to the
   * reference type represented by this {@code Class} object without
   * raising a {@code ClassCastException.} It returns {@code false}
   * otherwise.
   *
   * <p> Specifically, if this {@code Class} object represents a
   * declared class, this method returns {@code true} if the specified
   * {@code Object} argument is an instance of the represented class (or
   * of any of its subclasses); it returns {@code false} otherwise. If
   * this {@code Class} object represents an array class, this method
   * returns {@code true} if the specified {@code Object} argument
   * can be converted to an object of the array class by an identity
   * conversion or by a widening reference conversion; it returns
   * {@code false} otherwise. If this {@code Class} object
   * represents an interface, this method returns {@code true} if the
   * class or any superclass of the specified {@code Object} argument
   * implements this interface; it returns {@code false} otherwise. If
   * this {@code Class} object represents a primitive type, this method
   * returns {@code false}.
   *
   * @param   obj the object to check
   * @return  true if {@code obj} is an instance of this class
   *
   * @since JDK1.1
   */
  bool isInstance(Object obj) {
    return obj is T;
  }

  /**
   * Determines if the class or interface represented by this
   * {@code Class} object is either the same as, or is a superclass or
   * superinterface of, the class or interface represented by the specified
   * {@code Class} parameter. It returns {@code true} if so;
   * otherwise it returns {@code false}. If this {@code Class}
   * object represents a primitive type, this method returns
   * {@code true} if the specified {@code Class} parameter is
   * exactly this {@code Class} object; otherwise it returns
   * {@code false}.
   *
   * <p> Specifically, this method tests whether the type represented by the
   * specified {@code Class} parameter can be converted to the type
   * represented by this {@code Class} object via an identity conversion
   * or via a widening reference conversion. See <em>The Java Language
   * Specification</em>, sections 5.1.1 and 5.1.4 , for details.
   *
   * @param cls the {@code Class} object to be checked
   * @return the {@code boolean} value indicating whether objects of the
   * type {@code cls} can be assigned to objects of this class
   * @exception NullPointerException if the specified Class parameter is
   *            null.
   * @since JDK1.1
   */
  bool isAssignableFrom(Class cls) {
    // TODO
  }

  /**
   * Determines if the specified {@code Class} object represents an
   * interface type.
   *
   * @return  {@code true} if this object represents an interface;
   *          {@code false} otherwise.
   */
  bool isInterface() {
    return false;
  }

  /**
   * Determines if this {@code Class} object represents an array class.
   *
   * @return  {@code true} if this object represents an array class;
   *          {@code false} otherwise.
   * @since   JDK1.1
   */
  bool isArray() {

  }

  /**
   * Returns true if this {@code Class} object represents an annotation
   * type.  Note that if this method returns true, {@link #isInterface()}
   * would also return true, as all annotation types are also interfaces.
   *
   * @return {@code true} if this class object represents an annotation
   *      type; {@code false} otherwise
   * @since 1.5
   */
  bool isAnnotation() {
    return (getModifiers() & ANNOTATION) != 0;
  }

  /**
   * Returns {@code true} if this class is a synthetic class;
   * returns {@code false} otherwise.
   * @return {@code true} if and only if this class is a synthetic class as
   *         defined by the Java Language Specification.
   * @jls 13.1 The Form of a Binary
   * @since 1.5
   */
  bool isSynthetic() {
    return (getModifiers() & SYNTHETIC) != 0;
  }


  /**
   * Returns the  name of the entity (class, interface, array class,
   * primitive type, or void) represented by this {@code Class} object,
   * as a {@code String}.
   */
  String getName() {
    return T.runtimeType.toString();
  }

  /**
   * Returns an array of {@code TypeVariable} objects that represent the
   * type variables declared by the generic declaration represented by this
   * {@code GenericDeclaration} object, in declaration order.  Returns an
   * array of length 0 if the underlying generic declaration declares no type
   * variables.
   *
   * @return an array of {@code TypeVariable} objects that represent
   *     the type variables declared by this generic declaration
   */
//  List<TypeVariable<Class<T>>> getTypeParameters() {
//    ClassRepository info = getGenericInfo();
//    if (info != null)
//      return (TypeVariable<Class<T>>[])info.getTypeParameters();
//    else
//      return List();
//  }


  /**
   * Returns the {@code Class} representing the superclass of the entity
   * (class, interface, primitive type or void) represented by this
   * {@code Class}.  If this {@code Class} represents either the
   * {@code Object} class, an interface, a primitive type, or void, then
   * null is returned.  If this object represents an array class then the
   * {@code Class} object representing the {@code Object} class is
   * returned.
   *
   * @return the superclass of the class represented by this object.
   */
  Class getSuperclass() {
    // TODO
  }

  /**
   * Returns the {@code Type} representing the direct superclass of
   * the entity (class, interface, primitive type or void) represented by
   * this {@code Class}.
   */
  Type getGenericSuperclass() {
    ClassRepository info = getGenericInfo();
    if (info == null) {
      return getSuperclass();
    }

    // Historical irregularity:
    // Generic signature marks interfaces with superclass = Object
    // but this API returns null for interfaces
    if (isInterface()) {
      return null;
    }

    return info.getSuperclass();
  }

  /**
   * Gets the package for this class.  The class loader of this class is used
   * to find the package.  If the class was loaded by the bootstrap class
   * loader the set of packages loaded from CLASSPATH is searched to find the
   * package of the class. Null is returned if no package object was created
   * by the class loader of this class.
   */
  @deprecated
  Null getPackage() {
    return null;
  }

  /**
   * Determines the interfaces implemented by the class or interface
   * represented by this object.
   *
   * @return an array of interfaces implemented by this class.
   */
  List<Class> getInterfaces() {

  }

  /**
   * Returns the {@code Class} representing the component type of an
   * array.  If this class does not represent an array class this method
   * returns null.
   *
   * @return the {@code Class} representing the component type of this
   */
  Class getComponentType() {

  }

  /**
   * Returns the Java language modifiers for this class or interface, encoded
   * in an integer. The modifiers consist of the Java Virtual Machine's
   * constants for {@code public}, {@code protected},
   * {@code private}, {@code final}, {@code static},
   * {@code abstract} and {@code interface}; they should be decoded
   * using the methods of class {@code Modifier}.
   *
   * @return the {@code int} representing the modifiers for this class
   */
  int getModifiers() {

  }

  List<Field> getFields() {}

  //---------------------------------------------------------------------
  // Implementation of PropertySources
  //---------------------------------------------------------------------
  @override
  T getAnnotation<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getAnnotation
  }

  @override
  List<Annotation> getAnnotations() {
    // TODO: implement getAnnotations
  }

  @override
  List<T> getAnnotationsByType<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getAnnotationsByType
  }

  @override
  T getDeclaredAnnotation<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getDeclaredAnnotation
  }

  @override
  List<Annotation> getDeclaredAnnotations() {
    // TODO: implement getDeclaredAnnotations
  }

  @override
  List<T> getDeclaredAnnotationsByType<T extends Annotation>(Class<T> annotationClass) {
    // TODO: implement getDeclaredAnnotationsByType
  }

  @override
  bool isAnnotationPresent(Class<Annotation> annotationClass) {
    // TODO: implement isAnnotationPresent
  }
}

class ReflectionData<T> {
  List<Field> declaredFields;
  List<Field> publicFields;
  List<Method> declaredMethods;
  List<Method> publicMethods;
  List<Constructor<T>> declaredConstructors;
  List<Constructor<T>> publicConstructors;
  // Intermediate results for getFields and getMethods
  List<Field> declaredPublicFields;
  List<Method> declaredPublicMethods;
  List<Class> interfaces;

  // Value of classRedefinedCount when we created this ReflectionData instance
  final int redefinedCount;

  ReflectionData(this.redefinedCount);
}

class A {}

void main() {
  Class(A);
}

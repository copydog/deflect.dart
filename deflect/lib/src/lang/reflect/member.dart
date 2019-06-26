import '../../class.dart';

/**
 * Member is an interface that reflects identifying information about
 * a single member (a field or a method) or a constructor.
 *
 * @see java.lang.Class
 * @see Field
 * @see Method
 * @see Constructor
 *
 * @author Nakul Saraiya
 */
abstract class Member {
  /**
   * Identifies the set of all public members of a class or interface,
   * including inherited members.
   */
  static final int PUBLIC = 0;

  /**
   * Identifies the set of declared members of a class or interface.
   * Inherited members are not included.
   */
  static final int DECLARED = 1;

  /**
   * Returns the Class object representing the class or interface
   * that declares the member or constructor represented by this Member.
   *
   * @return an object representing the declaring class of the
   * underlying member
   */
  Class getDeclaringClass();

  /**
   * Returns the simple name of the underlying member or constructor
   * represented by this Member.
   *
   * @return the simple name of the underlying member
   */
  String getName();

  /**
   * Returns the Java language modifiers for the member or
   * constructor represented by this Member, as an integer.  The
   * Modifier class should be used to decode the modifiers in
   * the integer.
   *
   * @return the Java language modifiers for the underlying member
   * @see Modifier
   */
  int getModifiers();

  /**
   * Returns {@code true} if this member was introduced by
   * the compiler; returns {@code false} otherwise.
   *
   * @return true if and only if this member was introduced by
   * the compiler.
   * @jls 13.1 The Form of a Binary
   * @since 1.5
   */
  bool isSynthetic();
}

import "dart:collection";

import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/type/type_base.dart";
import "package:code/src/interfaces/visitor.dart";

class GenericType implements TypeCode {
  const GenericType(this.constructor, this.arguments);

  final TypeBase constructor;
  final LinkedHashSet<TypeCode> arguments;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitGenericType(this);
}

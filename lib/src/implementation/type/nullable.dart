import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/visitor.dart";

class NullableType implements TypeCode {
  const NullableType(this.subType);

  final TypeCode subType;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullableType(this);
}

extension NullableTypeExtension on TypeCode {
  NullableType get nullable => NullableType(this);
}

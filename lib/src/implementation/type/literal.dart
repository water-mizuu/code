import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/type/type_base.dart";
import "package:code/src/interfaces/visitor.dart";

class LiteralType implements TypeCode, TypeBase {
  const LiteralType(this.literal);
  final IdentifierLiteral literal;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitLiteralType(this);
}

extension LiteralTypeExtension on IdentifierLiteral {
  LiteralType get type => LiteralType(this);
}

class IdentifierGeneratorHelper {
  const IdentifierGeneratorHelper();

  @override
  IdentifierLiteral noSuchMethod(Invocation invocation) =>
      invocation.memberName.toString().substring(8, invocation.memberName.toString().length - 2).identifier;
}

const IdentifierGeneratorHelper identifier = IdentifierGeneratorHelper();

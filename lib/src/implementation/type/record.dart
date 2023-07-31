import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/visitor.dart";

class RecordType implements TypeCode {
  const RecordType(this.positionalDeclarations, this.namedDeclarations);

  final Set<(TypeCode, IdentifierLiteral?)>? positionalDeclarations;
  final Set<(TypeCode, IdentifierLiteral)>? namedDeclarations;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitRecordType(this);
}

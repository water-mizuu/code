import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/type/type_base.dart";
import "package:code/src/interfaces/visitor.dart";

class NamespaceAccessType implements TypeCode, TypeBase {
  const NamespaceAccessType(this.namespace, this.type);

  final IdentifierLiteral namespace;
  final TypeCode type;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNamespaceAccessType(this);
}

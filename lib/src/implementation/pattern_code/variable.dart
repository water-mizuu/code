import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/visitor.dart";

final class VariablePattern implements PatternCode {
  const VariablePattern(this.name, [this.type]);

  final IdentifierLiteral name;
  final TypeCode? type;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitVariablePattern(this);
}

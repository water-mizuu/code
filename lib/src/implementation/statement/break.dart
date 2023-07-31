import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class BreakStatement implements Statement {
  const BreakStatement([this.label]);

  final IdentifierLiteral? label;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitBreakStatement(this);
}

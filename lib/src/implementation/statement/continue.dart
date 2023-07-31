import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/statement/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class ContinueStatement implements Statement {
  const ContinueStatement([this.label]);

  final IdentifierLiteral? label;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitContinueStatement(this);
}

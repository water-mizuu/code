import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

/// Represents a labeled statement.
final class LabeledStatement implements Statement {
  const LabeledStatement(this.label, this.child);

  final IdentifierLiteral label;
  final Statement child;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitLabeledStatement(this);
}

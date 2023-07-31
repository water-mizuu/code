import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement/statement.dart";
import "package:code/src/interfaces/visitor.dart";

/// Represents a while-loop statement.
final class WhileLoopStatement implements Statement {
  const WhileLoopStatement(this.condition, this.body);

  final Expression condition;
  final Statement body;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitWhileLoopStatement(this);
}

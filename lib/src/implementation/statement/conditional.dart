import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class IfStatement implements Statement {
  const IfStatement(this.condition, this.thenStatement, [this.elseStatement]);

  final Expression condition;
  final Statement thenStatement;
  final Statement? elseStatement;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitIfStatement(this);
}

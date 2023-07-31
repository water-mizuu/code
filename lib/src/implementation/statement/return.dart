import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

/// Represents a return statement that can have either no return value or an expression.
final class ReturnStatement implements Statement {
  const ReturnStatement([this.expression]);

  final Expression? expression;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitReturnStatement(this);
}

import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class ExpressionStatement implements Statement {
  const ExpressionStatement(this.expression);

  final StandaloneExpression expression;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitExpressionStatement(this);
}

extension ExpressionStatementExtension on StandaloneExpression {
  ExpressionStatement get statement => ExpressionStatement(this);
}

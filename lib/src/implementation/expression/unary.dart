import "package:code/src/implementation/operator/unary.dart";
import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class PrefixUnaryExpression implements Expression, StandaloneExpression {
  const PrefixUnaryExpression(this.target, this.operator);

  final Expression target;
  final PrefixUnaryOperator operator;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitPrefixUnaryExpression(this);
}

final class PostfixUnaryExpression implements Expression, StandaloneExpression {
  const PostfixUnaryExpression(this.target, this.operator);

  final Expression target;
  final PrefixUnaryOperator operator;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitPostfixUnaryExpression(this);
}

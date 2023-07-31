import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class ParenthesizedExpression implements Expression, StandaloneExpression, ContainerExpression {
  const ParenthesizedExpression(this.subExpression);

  final Expression subExpression;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitParenthesizedExpression(this);
}

extension ParenthesizedExpressionExtension on Expression {
  ParenthesizedExpression get parenthesized => ParenthesizedExpression(this);
}

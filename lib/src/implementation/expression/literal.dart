import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/literal.dart";
import "package:code/src/interfaces/visitor.dart";

final class LiteralExpression implements Expression, ContainerExpression {
  const LiteralExpression(this.literal);

  final Literal literal;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitLiteralExpression(this);
}

extension LiteralExpressionExtension on Literal {
  LiteralExpression get expression => LiteralExpression(this);
}

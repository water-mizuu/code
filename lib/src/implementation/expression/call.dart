import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class CallExpression implements Expression, ContainerExpression {
  const CallExpression(this.target, [this.arguments = const <Expression>[]]);

  final Expression target;
  final List<Expression> arguments;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitCallExpression(this);
}

final class NullAwareCallExpression implements Expression {
  const NullAwareCallExpression(this.target, [this.arguments = const <Expression>[]]);

  final Expression target;
  final List<Expression> arguments;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullAwareCallExpression(this);
}

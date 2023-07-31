import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class CallExpression implements Expression, ContainerExpression {
  const CallExpression(
    this.target, [
    this.positionalArguments = const <Expression>[],
    this.namedArguments = const <IdentifierLiteral, Expression>{},
  ]);

  final Expression target;
  final List<Expression> positionalArguments;
  final Map<IdentifierLiteral, Expression> namedArguments;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitCallExpression(this);
}

final class NullAwareCallExpression implements Expression {
  const NullAwareCallExpression(
    this.target, [
    this.positionalArguments = const <Expression>[],
    this.namedArguments = const <IdentifierLiteral, Expression>{},
  ]);

  final Expression target;
  final List<Expression> positionalArguments;
  final Map<IdentifierLiteral, Expression> namedArguments;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullAwareCallExpression(this);
}

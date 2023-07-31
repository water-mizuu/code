import "package:code/src/implementation/operator/binary.dart";
import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class BinaryExpression implements Expression, StandaloneExpression, ContainerExpression {
  const BinaryExpression(this.left, this.operator, this.right);

  final Expression left;
  final BinaryOperator operator;
  final Expression right;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitBinaryExpression(this);
}

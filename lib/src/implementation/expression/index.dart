import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class IndexExpression implements StandaloneExpression, ContainerExpression {
  const IndexExpression(this.target, this.index);

  final Expression target;
  final Expression index;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitIndexExpression(this);
}

final class NullAwareIndexExpression implements StandaloneExpression {
  const NullAwareIndexExpression(this.target, this.index);

  final Expression target;
  final Expression index;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullAwareIndexExpression(this);
}

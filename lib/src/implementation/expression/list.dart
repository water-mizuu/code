import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class ListExpression implements Expression, StandaloneExpression, ContainerExpression {
  const ListExpression([this.children = const <ContainerExpression>[]]);

  final List<ContainerExpression> children;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitListExpression(this);
}

import "package:code/code.dart";

class ContainerConditionalExpression implements ContainerExpression {
  const ContainerConditionalExpression(this.condition, this.thenExpression, [this.elseExpression]);

  final Expression condition;
  final ContainerExpression thenExpression;
  final ContainerExpression? elseExpression;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitContainerConditionalExpression(this);
}

class ContainerPatternConditionalExpression implements ContainerExpression {
  const ContainerPatternConditionalExpression(this.target, this.matcher, this.thenExpression, [this.elseExpression]);

  final Expression target;
  final PatternCode matcher;
  final ContainerExpression thenExpression;
  final ContainerExpression? elseExpression;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitContainerPatternConditionalExpression(this);
}

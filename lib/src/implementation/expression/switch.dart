import "package:code/code.dart";

final class SwitchExpression implements Expression, ContainerExpression {
  const SwitchExpression(this.target, this.cases);

  final Expression target;
  final Set<SwitchExpressionCase> cases;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitSwitchExpression(this);
}

final class SwitchExpressionCase implements Code {
  const SwitchExpressionCase(this.pattern, this.body);

  final PatternCode pattern;
  final Expression body;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitSwitchExpressionCase(this);
}

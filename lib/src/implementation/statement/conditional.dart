import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class ConditionalStatement implements Statement {
  const ConditionalStatement(this.condition, this.thenStatement, [this.elseStatement]);

  final Expression condition;
  final Statement thenStatement;
  final Statement? elseStatement;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitConditionalStatement(this);
}

final class PatternConditionalStatement implements Statement {
  const PatternConditionalStatement(this.target, this.matcher, this.thenStatement, [this.elseStatement]);

  final Expression target;
  final PatternCode matcher;
  final Statement thenStatement;
  final Statement? elseStatement;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitPatternConditionalStatement(this);
}

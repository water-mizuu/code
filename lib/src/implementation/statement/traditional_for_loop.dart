import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

/// Represents a for-loop in the traditional C-style.
/// ```dart
/// for (<initialization>; <condition>; <increment>) <body>
/// ```
final class TraditionalForLoopStatement implements Statement {
  const TraditionalForLoopStatement(
    this.body, {
    this.initialization,
    this.condition,
    this.increment,
  });

  final TraditionalForLoopInitialization? initialization;
  final Expression? condition;
  final Expression? increment;
  final Statement body;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitTraditionalForLoopStatement(this);
}

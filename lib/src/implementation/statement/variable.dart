import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/visitor.dart";

/// Represents a variable declaration statement.
final class VariableDeclarationStatement implements Statement, TraditionalForLoopInitialization {
  const VariableDeclarationStatement(this.type, this.declarations);

  final TypeCode? type;
  final List<(String, Expression)> declarations;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitVariableDeclarationStatement(this);
}

import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class BlockStatement implements Statement {
  const BlockStatement(this.statements);

  final List<Statement> statements;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitBlockStatement(this);
}

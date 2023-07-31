import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/visitor.dart";

final class EmptyStatement implements Statement {
  const EmptyStatement();

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitEmptyStatement(this);
}

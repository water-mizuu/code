import "package:code/src/interfaces/literal.dart";
import "package:code/src/interfaces/visitor.dart";

final class StringLiteral implements Literal {
  const StringLiteral(this.value);

  final String value;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitStringLiteral(this);
}

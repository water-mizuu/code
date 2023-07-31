import "package:code/src/interfaces/literal.dart";
import "package:code/src/interfaces/visitor.dart";

final class NumberLiteral implements Literal {
  const NumberLiteral(this.value);

  final num value;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNumberLiteral(this);
}

extension NumberLiteralExtension on num {
  NumberLiteral get literal => NumberLiteral(this);
}

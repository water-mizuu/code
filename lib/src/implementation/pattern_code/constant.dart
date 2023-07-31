import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class ConstantPattern implements PatternCode, ContainerSubPattern {
  const ConstantPattern(this.value);

  final Expression value;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitConstantPattern(this);
}

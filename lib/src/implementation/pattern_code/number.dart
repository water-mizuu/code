import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class NumberPattern implements PatternCode, ContainerSubPattern {
  const NumberPattern(this.value);

  final num value;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNumberPattern(this);
}

extension NumberPatternExtension on num {
  NumberPattern get pattern => NumberPattern(this);
}

import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class NullCheckPattern implements PatternCode {
  const NullCheckPattern(this.subPattern);

  final PatternCode subPattern;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullCheckPattern(this);
}

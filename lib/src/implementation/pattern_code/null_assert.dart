import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class NullAssertPattern implements PatternCode {
  const NullAssertPattern(this.subPattern);

  final PatternCode subPattern;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullAssertPattern(this);
}

import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class ParenthesizedPattern implements PatternCode {
  const ParenthesizedPattern(this.subPattern);

  final PatternCode subPattern;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitParenthesizedPattern(this);
}

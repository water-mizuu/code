import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class WildcardPattern implements PatternCode, ContainerSubPattern {
  const WildcardPattern();

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitWildcardPattern(this);
}

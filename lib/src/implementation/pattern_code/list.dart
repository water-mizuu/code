import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class ListPattern implements PatternCode {
  const ListPattern(this.subPatterns);

  final List<ContainerSubPattern> subPatterns;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitListPattern(this);
}

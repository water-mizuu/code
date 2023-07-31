import "package:code/src/interfaces/operator.dart";
import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class RelationalPattern implements PatternCode, ContainerSubPattern {
  const RelationalPattern(this.operator, this.subPattern);

  final RelationalOperator operator;
  final PatternCode subPattern;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitRelationalPattern(this);
}

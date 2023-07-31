import "package:code/src/interfaces/operator.dart";
import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class BinaryPattern implements PatternCode {
  const BinaryPattern(this.left, this.operator, this.right);

  final PatternCode left;
  final LogicalOperator operator;
  final PatternCode right;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitBinaryPattern(this);
}

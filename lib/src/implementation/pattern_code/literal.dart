import "package:code/src/interfaces/literal.dart";
import "package:code/src/interfaces/pattern_code.dart";
import "package:code/src/interfaces/visitor.dart";

final class LiteralPattern implements PatternCode, ContainerSubPattern {
  const LiteralPattern(this.literal);

  final Literal literal;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitLiteralPattern(this);
}

extension LiteralPatternExtension on Literal {
  LiteralPattern get pattern => LiteralPattern(this);
}

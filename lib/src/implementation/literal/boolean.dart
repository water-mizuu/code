import "package:code/src/interfaces/literal.dart";
import "package:code/src/interfaces/visitor.dart";

sealed class BooleanLiteral implements Literal {}

final class TrueLiteral implements BooleanLiteral {
  const TrueLiteral();

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitTrueLiteral(this);
}

final class FalseLiteral implements BooleanLiteral {
  const FalseLiteral();

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitFalseLiteral(this);
}

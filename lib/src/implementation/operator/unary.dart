import "package:code/src/interfaces/operator.dart";
import "package:code/src/interfaces/visitor.dart";

enum PrefixUnaryOperator implements Operator {
  minus("-"),
  exclamation("!"),
  tilde("~"),
  doublePlus("++"),
  doubleMinus("--"),
  awaitFuture("await"),
  ;

  const PrefixUnaryOperator(this.symbol);

  final String symbol;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitPrefixUnaryOperator(this);
}

enum PostfixUnaryOperator implements Operator {
  doublePlus("++"),
  doubleMinus("--"),
  ;

  const PostfixUnaryOperator(this.symbol);

  final String symbol;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitPostfixUnaryOperator(this);
}

import "package:code/src/interfaces/operator.dart";
import "package:code/src/interfaces/visitor.dart";

sealed class BinaryOperator implements Operator {
  const BinaryOperator(this.symbol);
  static const DoubleAmpersandOperator doubleAmpersand = DoubleAmpersandOperator();
  static const DoubleBarOperator doubleBar = DoubleBarOperator();
  static const AmpersandOperator ampersand = AmpersandOperator();
  static const BarOperator bar = BarOperator();
  static const CaretOperator caret = CaretOperator();
  static const AmpersandEqualOperator ampersandEqual = AmpersandEqualOperator();
  static const BarEqualOperator barEqual = BarEqualOperator();
  static const CaretEqualOperator caretEqual = CaretEqualOperator();
  static const DoubleEqualOperator doubleEqual = DoubleEqualOperator();
  static const ExclamationEqualOperator exclamationEqual = ExclamationEqualOperator();
  static const LessOperator less = LessOperator();
  static const LessEqualOperator lessEqual = LessEqualOperator();
  static const GreaterOperator greater = GreaterOperator();
  static const GreaterEqualOperator greaterEqual = GreaterEqualOperator();
  static const IsTypeOperator isType = IsTypeOperator();
  static const IsNotTypeOperator isNotType = IsNotTypeOperator();
  static const AsTypeOperator asType = AsTypeOperator();
  static const DoubleLessOperator doubleLess = DoubleLessOperator();
  static const DoubleGreaterOperator doubleGreater = DoubleGreaterOperator();
  static const TripleGreaterOperator tripleGreater = TripleGreaterOperator();
  static const DoubleLessEqualOperator doubleLessEqual = DoubleLessEqualOperator();
  static const DoubleGreaterEqualOperator doubleGreaterEqual = DoubleGreaterEqualOperator();
  static const TripleGreaterEqualOperator tripleGreaterEqual = TripleGreaterEqualOperator();
  static const PlusOperator plus = PlusOperator();
  static const MinusOperator minus = MinusOperator();
  static const StarOperator star = StarOperator();
  static const SlashOperator slash = SlashOperator();
  static const PercentOperator percent = PercentOperator();
  static const TildeSlashOperator tildeSlash = TildeSlashOperator();
  static const PlusEqualOperator plusEqual = PlusEqualOperator();
  static const MinusEqualOperator minusEqual = MinusEqualOperator();
  static const StarEqualOperator starEqual = StarEqualOperator();
  static const SlashEqualOperator slashEqual = SlashEqualOperator();
  static const PercentEqualOperator percentEqual = PercentEqualOperator();
  static const TildeSlashEqualOperator tildeSlashEqual = TildeSlashEqualOperator();
  static const EqualOperator equal = EqualOperator();
  static const DoubleQuestionOperator doubleQuestion = DoubleQuestionOperator();
  static const DoubleQuestionEqualOperator doubleQuestionEqual = DoubleQuestionEqualOperator();

  final String symbol;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitBinaryOperator(this);
}

class DoubleAmpersandOperator extends BinaryOperator implements LogicalOperator {
  const DoubleAmpersandOperator() : super("&&");
}

class DoubleBarOperator extends BinaryOperator implements LogicalOperator {
  const DoubleBarOperator() : super("||");
}

class AmpersandOperator extends BinaryOperator implements BitwiseOperator {
  const AmpersandOperator() : super("&");
}

class BarOperator extends BinaryOperator implements BitwiseOperator {
  const BarOperator() : super("|");
}

class CaretOperator extends BinaryOperator implements LogicalOperator, BitwiseOperator {
  const CaretOperator() : super("^");
}

class AmpersandEqualOperator extends BinaryOperator implements AssignmentOperator {
  const AmpersandEqualOperator() : super("&=");
}

class BarEqualOperator extends BinaryOperator implements AssignmentOperator {
  const BarEqualOperator() : super("|=");
}

class CaretEqualOperator extends BinaryOperator implements AssignmentOperator {
  const CaretEqualOperator() : super("^=");
}

class DoubleEqualOperator extends BinaryOperator implements RelationalOperator {
  const DoubleEqualOperator() : super("==");
}

class ExclamationEqualOperator extends BinaryOperator implements RelationalOperator {
  const ExclamationEqualOperator() : super("!=");
}

class LessOperator extends BinaryOperator implements RelationalOperator {
  const LessOperator() : super("<");
}

class LessEqualOperator extends BinaryOperator implements RelationalOperator {
  const LessEqualOperator() : super("<=");
}

class GreaterOperator extends BinaryOperator implements RelationalOperator {
  const GreaterOperator() : super(">");
}

class GreaterEqualOperator extends BinaryOperator implements RelationalOperator {
  const GreaterEqualOperator() : super(">=");
}

class IsTypeOperator extends BinaryOperator implements TypeRelationOperator {
  const IsTypeOperator() : super("is");
}

class IsNotTypeOperator extends BinaryOperator implements TypeRelationOperator {
  const IsNotTypeOperator() : super("is!");
}

class AsTypeOperator extends BinaryOperator implements TypeCastOperator {
  const AsTypeOperator() : super("as");
}

class DoubleLessOperator extends BinaryOperator implements BitwiseOperator, ShiftOperator {
  const DoubleLessOperator() : super("<<");
}

class DoubleGreaterOperator extends BinaryOperator implements BitwiseOperator, ShiftOperator {
  const DoubleGreaterOperator() : super(">>");
}

class TripleGreaterOperator extends BinaryOperator implements BitwiseOperator, ShiftOperator {
  const TripleGreaterOperator() : super(">>>");
}

class DoubleLessEqualOperator extends BinaryOperator implements AssignmentOperator {
  const DoubleLessEqualOperator() : super("<<=");
}

class DoubleGreaterEqualOperator extends BinaryOperator implements AssignmentOperator {
  const DoubleGreaterEqualOperator() : super(">>=");
}

class TripleGreaterEqualOperator extends BinaryOperator implements AssignmentOperator {
  const TripleGreaterEqualOperator() : super(">>>=");
}

class PlusOperator extends BinaryOperator implements ArithmeticOperator {
  const PlusOperator() : super("+");
}

class MinusOperator extends BinaryOperator implements ArithmeticOperator {
  const MinusOperator() : super("-");
}

class StarOperator extends BinaryOperator implements ArithmeticOperator {
  const StarOperator() : super("*");
}

class SlashOperator extends BinaryOperator implements ArithmeticOperator {
  const SlashOperator() : super("/");
}

class PercentOperator extends BinaryOperator implements ArithmeticOperator {
  const PercentOperator() : super("%");
}

class TildeSlashOperator extends BinaryOperator implements ArithmeticOperator {
  const TildeSlashOperator() : super("~/");
}

class PlusEqualOperator extends BinaryOperator implements AssignmentOperator {
  const PlusEqualOperator() : super("+=");
}

class MinusEqualOperator extends BinaryOperator implements AssignmentOperator {
  const MinusEqualOperator() : super("-=");
}

class StarEqualOperator extends BinaryOperator implements AssignmentOperator {
  const StarEqualOperator() : super("*=");
}

class SlashEqualOperator extends BinaryOperator implements AssignmentOperator {
  const SlashEqualOperator() : super("/=");
}

class PercentEqualOperator extends BinaryOperator implements AssignmentOperator {
  const PercentEqualOperator() : super("%=");
}

class TildeSlashEqualOperator extends BinaryOperator implements AssignmentOperator {
  const TildeSlashEqualOperator() : super("~/=");
}

class EqualOperator extends BinaryOperator implements AssignmentOperator {
  const EqualOperator() : super("=");
}

class DoubleQuestionOperator extends BinaryOperator implements NullAwareOperator {
  const DoubleQuestionOperator() : super("??");
}

class DoubleQuestionEqualOperator extends BinaryOperator implements AssignmentOperator {
  const DoubleQuestionEqualOperator() : super("??");
}

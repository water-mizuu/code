import "package:code/code.dart";

/// Semantic representation of a binary operator.
/// The reason why the values are named off their symbols is
/// because of operator overloading.
abstract interface class Operator implements Code {}

abstract interface class RelationalOperator implements Operator {}

abstract interface class LogicalOperator implements Operator {}

abstract interface class ArithmeticOperator implements Operator {}

abstract interface class BitwiseOperator implements Operator {}

abstract interface class AssignmentOperator implements Operator {}

abstract interface class TypeRelationOperator implements Operator {}

abstract interface class TypeCastOperator implements Operator {}

abstract interface class NullAwareOperator implements Operator {}

abstract interface class ShiftOperator implements Operator {}

import "package:code/code.dart";

/// Represents a valid Dart expression.
abstract interface class Expression implements Code, TraditionalForLoopInitialization {}

/// Represents a valid Dart expression that can be used as a standalone statement.
abstract interface class StandaloneExpression implements Code {}

abstract interface class AtomicExpression implements Code {}

/// Expressions that can be used inside containers.
abstract interface class ContainerExpression implements Code {}

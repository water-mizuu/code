import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/code.dart";
import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/statement.dart";
import "package:code/src/interfaces/type/type.dart";
import "package:code/src/interfaces/visitor.dart";

final class BlockFunctionStatement implements Statement {
  const BlockFunctionStatement({
    required this.name,
    required this.body,
    this.valueParameters,
    this.typeParameters,
    this.returnType,
  });

  final TypeCode? returnType;
  final IdentifierLiteral name;
  final Set<(IdentifierLiteral typeName, TypeCode? superType)>? typeParameters;
  final ValueParameters? valueParameters;
  final List<Statement> body;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitBlockFunctionStatement(this);
}

final class InlineFunctionStatement implements Statement {
  const InlineFunctionStatement({
    required this.name,
    required this.body,
    this.valueParameters,
    this.typeParameters,
    this.returnType,
  });

  final TypeCode? returnType;
  final IdentifierLiteral name;
  final Set<(IdentifierLiteral typeName, TypeCode? superType)>? typeParameters;
  final ValueParameters? valueParameters;
  final Expression body;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitInlineFunctionStatement(this);
}

sealed class ValueParameters implements Code {
  const factory ValueParameters(Set<(TypeCode? type, IdentifierLiteral name)> positionalParameters) =
      PositionalParameters;
  const factory ValueParameters.withOptional(
    Set<(TypeCode? type, IdentifierLiteral name)> positionalParameters,
    Set<(TypeCode? type, IdentifierLiteral name, {Expression? defaultValue})> optionalParameters,
  ) = OptionalParameters;
  const factory ValueParameters.withNamed(
    Set<(TypeCode? type, IdentifierLiteral name)> positionalParameters,
    Set<(TypeCode? type, IdentifierLiteral name, {bool isRequired, Expression? defaultValue})> namedParameters,
  ) = NamedParameters;
}

final class PositionalParameters implements ValueParameters {
  const PositionalParameters(this.positionalParameters);

  final Set<(TypeCode? type, IdentifierLiteral name)> positionalParameters;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitPositionalParameters(this);
}

final class OptionalParameters implements ValueParameters {
  const OptionalParameters(this.positionalParameters, this.optionalParameters);

  final Set<(TypeCode? type, IdentifierLiteral name)> positionalParameters;
  final Set<(TypeCode? type, IdentifierLiteral name, {Expression? defaultValue})> optionalParameters;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitOptionalParameters(this);
}

final class NamedParameters implements ValueParameters {
  const NamedParameters(this.positionalParameters, this.namedParameters);

  final Set<(TypeCode? type, IdentifierLiteral name)> positionalParameters;
  final Set<(TypeCode? type, IdentifierLiteral name, {bool isRequired, Expression? defaultValue})> namedParameters;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNamedParameters(this);
}

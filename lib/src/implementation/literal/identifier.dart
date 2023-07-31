import "package:code/src/interfaces/literal.dart";
import "package:code/src/interfaces/visitor.dart";

final class IdentifierLiteral implements Literal {
  const IdentifierLiteral(this.identifier);
  static IdentifierLiteral? tryParse(String input) =>
      switch (RegExp(r"[A-Za-z_$][A-Za-z0-9_$]*").matchAsPrefix(input)) {
        Match match => IdentifierLiteral(match[0]!),
        _ => null,
      };
  static IdentifierLiteral parse(String input) =>
      tryParse(input) ?? (throw FormatException("Invalid identifier literal: $input"));

  final String identifier;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitIdentifierLiteral(this);
}

extension IdentifierLiteralExtension on String {
  IdentifierLiteral get identifier => IdentifierLiteral.parse(this);
}

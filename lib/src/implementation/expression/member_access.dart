import "package:code/src/implementation/literal/identifier.dart";
import "package:code/src/interfaces/expression.dart";
import "package:code/src/interfaces/visitor.dart";

final class MemberAccessExpression implements Expression, ContainerExpression {
  const MemberAccessExpression(this.target, this.member);

  final Expression target;
  final IdentifierLiteral member;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitMemberAccessExpression(this);
}

final class NullAwareMemberAccessExpression implements Expression, ContainerExpression {
  const NullAwareMemberAccessExpression(this.target, this.member);

  final Expression target;
  final IdentifierLiteral member;

  @override
  O acceptVisitor<O>(CodeVisitor<O> visitor) => visitor.visitNullAwareMemberAccessExpression(this);
}

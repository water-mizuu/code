import "package:code/code.dart";

abstract interface class CodeVisitor<O> {
  O visitTrueLiteral(TrueLiteral literal);
  O visitFalseLiteral(FalseLiteral literal);
  O visitIdentifierLiteral(IdentifierLiteral literal);
  O visitNumberLiteral(NumberLiteral literal);
  O visitStringLiteral(StringLiteral literal);

  O visitBinaryExpression(BinaryExpression expression);
  O visitContainerPatternConditionalExpression(ContainerPatternConditionalExpression expression);
  O visitContainerConditionalExpression(ContainerConditionalExpression expression);
  O visitCallExpression(CallExpression expression);
  O visitNullAwareCallExpression(NullAwareCallExpression expression);
  O visitIndexExpression(IndexExpression expression);
  O visitNullAwareIndexExpression(NullAwareIndexExpression expression);
  O visitListExpression(ListExpression expression);
  O visitLiteralExpression(LiteralExpression expression);
  O visitMemberAccessExpression(MemberAccessExpression expression);
  O visitNullAwareMemberAccessExpression(NullAwareMemberAccessExpression expression);
  O visitParenthesizedExpression(ParenthesizedExpression expression);
  O visitSwitchExpression(SwitchExpression expression);
  O visitSwitchExpressionCase(SwitchExpressionCase expression);
  O visitPostfixUnaryExpression(PostfixUnaryExpression expression);
  O visitPrefixUnaryExpression(PrefixUnaryExpression expression);

  O visitBinaryOperator(BinaryOperator operator);
  O visitPostfixUnaryOperator(PostfixUnaryOperator operator);
  O visitPrefixUnaryOperator(PrefixUnaryOperator operator);

  O visitConstantPattern(ConstantPattern pattern);
  O visitListPattern(ListPattern pattern);
  O visitNullAssertPattern(NullAssertPattern pattern);
  O visitNullCheckPattern(NullCheckPattern pattern);
  O visitNumberPattern(NumberPattern pattern);
  O visitParenthesizedPattern(ParenthesizedPattern pattern);
  O visitRelationalPattern(RelationalPattern pattern);
  O visitVariablePattern(VariablePattern pattern);
  O visitWildcardPattern(WildcardPattern pattern);

  O visitBlockStatement(BlockStatement statement);
  O visitBreakStatement(BreakStatement statement);
  O visitIfStatement(IfStatement statement);
  O visitContinueStatement(ContinueStatement statement);
  O visitEmptyStatement(EmptyStatement statement);
  O visitExpressionStatement(ExpressionStatement statement);

  O visitBlockFunctionStatement(BlockFunctionStatement statement);
  O visitInlineFunctionStatement(InlineFunctionStatement statement);

  O visitPositionalParameters(PositionalParameters parameters);
  O visitOptionalParameters(OptionalParameters parameters);
  O visitNamedParameters(NamedParameters parameters);

  O visitLabeledStatement(LabeledStatement statement);
  O visitReturnStatement(ReturnStatement statement);
  O visitTraditionalForLoopStatement(TraditionalForLoopStatement statement);
  O visitVariableDeclarationStatement(VariableDeclarationStatement statement);
  O visitWhileLoopStatement(WhileLoopStatement statement);

  O visitGenericType(GenericType type);
  O visitLiteralType(LiteralType type);
  O visitNamespaceAccessType(NamespaceAccessType type);
  O visitNullableType(NullableType type);
  O visitRecordType(RecordType type);
}

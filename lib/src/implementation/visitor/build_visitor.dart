// ignore_for_file: always_specify_types

import "dart:convert";

import "package:code/code.dart";

class CodeBuilder implements CodeVisitor<String> {
  @override
  String visitTrueLiteral(TrueLiteral literal) => "true";

  @override
  String visitFalseLiteral(FalseLiteral literal) => "false";

  @override
  String visitIdentifierLiteral(IdentifierLiteral literal) => literal.identifier;

  @override
  String visitNumberLiteral(NumberLiteral literal) => literal.value.toString();

  @override
  String visitStringLiteral(StringLiteral literal) => jsonEncode(literal);

  @override
  String visitBinaryExpression(BinaryExpression expression) => "${expression.left.acceptVisitor(this)} "
      "${expression.operator.acceptVisitor(this)} "
      "${expression.right.acceptVisitor(this)}";

  @override
  String visitContainerPatternConditionalExpression(ContainerPatternConditionalExpression expression) {
    var buffer = StringBuffer().safe();
    buffer.write("if (");
    buffer.write(expression.target.acceptVisitor(this));
    buffer.write(" case ");
    buffer.write(expression.matcher.acceptVisitor(this));
    buffer.writeln(")");
    buffer.writeln(expression.thenExpression.acceptVisitor(this).indent());
    if (expression.elseExpression case ContainerExpression expression) {
      buffer.writeln("else");
      buffer.writeln(expression.acceptVisitor(this).indent());
    }
    return buffer.toString();
  }

  @override
  String visitContainerConditionalExpression(ContainerConditionalExpression expression) {
    var buffer = StringBuffer().safe();
    buffer.write("if (");
    buffer.write(expression.condition.acceptVisitor(this));
    buffer.writeln(")");
    buffer.writeln(expression.thenExpression.acceptVisitor(this).indent());
    if (expression.elseExpression case ContainerExpression expression) {
      buffer.writeln("else");
      buffer.writeln(expression.acceptVisitor(this).indent());
    }
    return buffer.toString();
  }

  @override
  String visitCallExpression(CallExpression expression) {
    var buffer = StringBuffer().safe();
    buffer.write(expression.target.acceptVisitor(this));
    buffer.write("(");
    buffer.write(expression.positionalArguments.map((Expression e) => e.acceptVisitor(this)).join(", "));
    if (expression.namedArguments case Map<IdentifierLiteral, Expression> namedArguments) {
      if (expression.positionalArguments.isNotEmpty) {
        buffer.write(", ");
      }
      for (var (int i, MapEntry(:IdentifierLiteral key, :Expression value)) in namedArguments.entries.indexed) {
        buffer.write(key.acceptVisitor(this));
        buffer.write(": ");
        buffer.write(value.acceptVisitor(this));
        if (i < namedArguments.length - 1) {
          buffer.write(", ");
        }
      }
    }
    buffer.write(")");

    return buffer.toString();
  }

  @override
  String visitNullAwareCallExpression(NullAwareCallExpression expression) {
    var buffer = StringBuffer().safe();
    buffer.write(expression.target.acceptVisitor(this));
    buffer.write("?.call(");
    buffer.write(expression.positionalArguments.map((Expression e) => e.acceptVisitor(this)).join(", "));
    if (expression.namedArguments case Map<IdentifierLiteral, Expression> namedArguments) {
      if (expression.positionalArguments.isNotEmpty) {
        buffer.write(", ");
      }
      for (var (int i, MapEntry(:IdentifierLiteral key, :Expression value)) in namedArguments.entries.indexed) {
        buffer.write(key.acceptVisitor(this));
        buffer.write(": ");
        buffer.write(value.acceptVisitor(this));
        if (i < namedArguments.length - 1) {
          buffer.write(", ");
        }
      }
    }
    buffer.write(")");

    return buffer.toString();
  }

  @override
  String visitIndexExpression(IndexExpression expression) =>
      "${expression.target.acceptVisitor(this)}[${expression.index.acceptVisitor(this)}]";

  @override
  String visitNullAwareIndexExpression(NullAwareIndexExpression expression) =>
      "${expression.target.acceptVisitor(this)}?[${expression.index.acceptVisitor(this)}]";

  @override
  String visitListExpression(ListExpression expression) {
    var buffer = StringBuffer().safe();
    buffer.write("[");
    buffer.write(expression.children.map((ContainerExpression e) => e.acceptVisitor(this)).join(", "));
    buffer.write("]");
    return buffer.toString();
  }

  @override
  String visitLiteralExpression(LiteralExpression expression) => expression.literal.acceptVisitor(this);

  @override
  String visitMemberAccessExpression(MemberAccessExpression expression) =>
      "${expression.target.acceptVisitor(this)}.${expression.member.acceptVisitor(this)}";

  @override
  String visitNullAwareMemberAccessExpression(NullAwareMemberAccessExpression expression) =>
      "${expression.target.acceptVisitor(this)}?.${expression.member.acceptVisitor(this)}";

  @override
  String visitParenthesizedExpression(ParenthesizedExpression expression) => //
      "(${expression.subExpression.acceptVisitor(this)})";

  @override
  String visitSwitchExpression(SwitchExpression expression) {
    var buffer = StringBuffer().safe();
    buffer.writeln("switch (${expression.target.acceptVisitor(this)}) {");
    for (SwitchExpressionCase e in expression.cases) {
      buffer.writeln(e.acceptVisitor(this).indent());
    }
    buffer.write("}");
    return buffer.toString();
  }

  @override
  String visitSwitchExpressionCase(SwitchExpressionCase expression) {
    var buffer = StringBuffer().safe();
    buffer.write(expression.pattern.acceptVisitor(this));
    buffer.write(" => ");
    buffer.write(expression.body.acceptVisitor(this));
    buffer.write(",");
    return buffer.toString();
  }

  @override
  String visitPostfixUnaryExpression(PostfixUnaryExpression expression) => //
      "${expression.target.acceptVisitor(this)}"
      "${expression.operator.acceptVisitor(this)}";

  @override
  String visitPrefixUnaryExpression(PrefixUnaryExpression expression) => //
      "${expression.operator.acceptVisitor(this)}"
      "${expression.target.acceptVisitor(this)}";

  @override
  String visitBinaryOperator(BinaryOperator operator) => operator.symbol;

  @override
  String visitPostfixUnaryOperator(PostfixUnaryOperator operator) => operator.symbol;

  @override
  String visitPrefixUnaryOperator(PrefixUnaryOperator operator) => operator.symbol;

  @override
  String visitConstantPattern(ConstantPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write("const (");
    buffer.write(pattern.value.acceptVisitor(this));
    buffer.write(")");

    return buffer.toString();
  }

  @override
  String visitListPattern(ListPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write("[");
    buffer.write(pattern.subPatterns.map((ContainerSubPattern e) => e.acceptVisitor(this)).join(", "));
    buffer.write("]");

    return buffer.toString();
  }

  @override
  String visitNullAssertPattern(NullAssertPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write(pattern.subPattern.acceptVisitor(this));
    buffer.write("!");

    return buffer.toString();
  }

  @override
  String visitNullCheckPattern(NullCheckPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write(pattern.subPattern.acceptVisitor(this));
    buffer.write("?");

    return buffer.toString();
  }

  @override
  String visitNumberPattern(NumberPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write(pattern.value.toString());

    return buffer.toString();
  }

  @override
  String visitParenthesizedPattern(ParenthesizedPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write("(");
    buffer.write(pattern.subPattern.acceptVisitor(this));
    buffer.write(")");

    return buffer.toString();
  }

  @override
  String visitRelationalPattern(RelationalPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write(pattern.operator.acceptVisitor(this));
    buffer.write(" ");
    buffer.write(pattern.subPattern.acceptVisitor(this));

    return buffer.toString();
  }

  @override
  String visitVariablePattern(VariablePattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write("var ");
    buffer.write(pattern.name.acceptVisitor(this));

    return buffer.toString();
  }

  @override
  String visitWildcardPattern(WildcardPattern pattern) {
    var buffer = StringBuffer().safe();
    buffer.write("_");

    return buffer.toString();
  }

  @override
  String visitBlockStatement(BlockStatement statement) {
    var buffer = StringBuffer().safe();
    buffer.writeln("{");
    for (Statement statement in statement.statements) {
      buffer.writeln(statement.acceptVisitor(this).indent());
    }
    buffer.write("}");
    return buffer.toString();
  }

  @override
  String visitBreakStatement(BreakStatement statement) {
    var buffer = StringBuffer().safe();
    buffer.write("break");
    if (statement.label case var label?) {
      buffer.write(" ");
      buffer.write(label.acceptVisitor(this));
    }
    buffer.write(";");

    return buffer.toString();
  }

  @override
  String visitIfStatement(IfStatement statement) {
    var buffer = StringBuffer().safe();
    buffer.write("if (");
    buffer.write(statement.condition.acceptVisitor(this));
    buffer.write(") ");
    buffer.write(statement.thenStatement.acceptVisitor(this));
    if (statement.elseStatement case Statement elseStatement) {
      buffer.write(" else ");
      buffer.write(elseStatement.acceptVisitor(this));
    }
    return buffer.toString();
  }

  @override
  String visitContinueStatement(ContinueStatement statement) {
    var buffer = StringBuffer().safe();
    buffer.write("continue");
    if (statement.label case var label?) {
      buffer.write(" ");
      buffer.write(label.acceptVisitor(this));
    }
    buffer.write(";");

    return buffer.toString();
  }

  @override
  String visitEmptyStatement(EmptyStatement statement) => ";";

  @override
  String visitExpressionStatement(ExpressionStatement statement) {
    var buffer = StringBuffer().safe();
    buffer.write(statement.expression.acceptVisitor(this));
    buffer.write(";");
    return buffer.toString();
  }

  @override
  String visitBlockFunctionStatement(BlockFunctionStatement statement) {
    var buffer = StringBuffer().safe();
    if (statement.returnType case var returnType?) {
      buffer.write(returnType.acceptVisitor(this));
      buffer.write(" ");
    }
    buffer.write(statement.name.acceptVisitor(this));
    if (statement.typeParameters case var typeParameters?) {
      buffer.write("<");
      for (var (index, (name, supertype)) in typeParameters.indexed) {
        buffer.write(name.acceptVisitor(this));
        if (supertype != null) {
          buffer.write(" extends ");
          buffer.write(supertype.acceptVisitor(this));
        }
        if (index < typeParameters.length - 1) {
          buffer.write(", ");
        }
      }
      buffer.write(">");
    }
    buffer.write("(");
    if (statement.valueParameters case var valueParameters?) {
      buffer.write(valueParameters.acceptVisitor(this));
    }

    buffer.writeln(") {");
    for (var child in statement.body) {
      buffer.writeln(child.acceptVisitor(this).indent());
    }
    buffer.write("}");

    return buffer.toString();
  }

  @override
  String visitInlineFunctionStatement(InlineFunctionStatement statement) {
    var buffer = StringBuffer().safe();
    if (statement.returnType case var returnType?) {
      buffer.write(returnType.acceptVisitor(this));
      buffer.write(" ");
    }
    buffer.write(statement.name.acceptVisitor(this));
    if (statement.typeParameters case var typeParameters?) {
      buffer.write("<");
      for (var (index, (name, supertype)) in typeParameters.indexed) {
        buffer.write(name.acceptVisitor(this));
        if (supertype != null) {
          buffer.write(" extends ");
          buffer.write(supertype.acceptVisitor(this));
        }
        if (index < typeParameters.length - 1) {
          buffer.write(", ");
        }
      }
      buffer.write(">");
    }
    buffer.write("(");
    if (statement.valueParameters case var valueParameters?) {
      buffer.write(valueParameters.acceptVisitor(this));
    }

    buffer.write(") => ");
    buffer.writeln(statement.body.acceptVisitor(this));

    return buffer.toString();
  }

  @override
  String visitPositionalParameters(PositionalParameters parameters) {
    var buffer = StringBuffer().safe();
    for (var (i, (type, name)) in parameters.positionalParameters.indexed) {
      if (type case var type?) {
        buffer.write(type.acceptVisitor(this));
        buffer.write(" ");
      }
      buffer.write(name.acceptVisitor(this));
      if (i < parameters.positionalParameters.length - 1) {
        buffer.write(", ");
      }
    }

    return buffer.toString();
  }

  @override
  String visitOptionalParameters(OptionalParameters parameters) {
    var buffer = StringBuffer().safe();
    for (var (i, (type, name)) in parameters.positionalParameters.indexed) {
      if (type case var type?) {
        buffer.write(type.acceptVisitor(this));
        buffer.write(" ");
      }
      buffer.write(name.acceptVisitor(this));
      if (parameters.optionalParameters.isNotEmpty || i < parameters.positionalParameters.length - 1) {
        buffer.write(", ");
      }
    }

    buffer.write("[");
    for (var (i, (type, name, :defaultValue)) in parameters.optionalParameters.indexed) {
      if (type case var type?) {
        buffer.write(type.acceptVisitor(this));
        buffer.write(" ");
      }

      buffer.write(name.acceptVisitor(this));

      if (defaultValue case var defaultValue?) {
        buffer.write(" = ");
        buffer.write(defaultValue.acceptVisitor(this));
      }

      if (i < parameters.optionalParameters.length - 1) {
        buffer.write(", ");
      }
    }
    buffer.write("]");

    return buffer.toString();
  }

  @override
  String visitNamedParameters(NamedParameters parameters) {
    var buffer = StringBuffer().safe();
    for (var (i, (type, name)) in parameters.positionalParameters.indexed) {
      if (type case var type?) {
        buffer.write(type.acceptVisitor(this));
        buffer.write(" ");
      }
      buffer.write(name.acceptVisitor(this));
      if (parameters.namedParameters.isNotEmpty || i < parameters.positionalParameters.length - 1) {
        buffer.write(", ");
      }
    }

    if (parameters.namedParameters case var namedParameters when namedParameters.isNotEmpty) {
      buffer.write("{");
      for (var (i, (type, name, :isRequired, :defaultValue)) in namedParameters.indexed) {
        if (isRequired) {
          buffer.write("required ");
        }

        if (type case var type?) {
          buffer.write(type.acceptVisitor(this));
          buffer.write(" ");
        }
        buffer.write(name.acceptVisitor(this));

        if (defaultValue case var defaultValue?) {
          buffer.write(" = ");
          buffer.write(defaultValue.acceptVisitor(this));
        }

        if (i < namedParameters.length - 1) {
          buffer.write(", ");
        }
      }
      buffer.write("}");
    }

    return buffer.toString();
  }

  @override
  String visitLabeledStatement(LabeledStatement statement) {
    var buffer = StringBuffer().safe();

    buffer.write(statement.label.acceptVisitor(this));
    buffer.writeln(":");
    buffer.writeln(statement.child.acceptVisitor(this).trimRight());

    return buffer.toString();
  }

  @override
  String visitReturnStatement(ReturnStatement statement) {
    var buffer = StringBuffer().safe();
    buffer.write("return");
    if (statement.expression case var expression?) {
      buffer.write(" ");
      buffer.write(expression.acceptVisitor(this));
    }
    buffer.write(";");

    return buffer.toString();
  }

  @override
  String visitTraditionalForLoopStatement(TraditionalForLoopStatement statement) {
    var buffer = StringBuffer().safe();

    buffer.write("for (");
    if (statement.initialization case var initialization?) {
      buffer.write(initialization.acceptVisitor(this));
    }
    buffer.write(";");
    if (statement.condition case var condition?) {
      buffer.write(" ");
      buffer.write(condition.acceptVisitor(this));
    }
    buffer.write(";");
    if (statement.increment case var increment?) {
      buffer.write(" ");
      buffer.write(increment.acceptVisitor(this));
    }
    buffer.write(")");
    buffer.write(statement.body.acceptVisitor(this));

    return buffer.toString();
  }

  @override
  String visitVariableDeclarationStatement(VariableDeclarationStatement statement) {
    var buffer = StringBuffer().safe();

    buffer.write(statement.type?.acceptVisitor(this) ?? "var");
    buffer.write(" ");

    for (var (int index, (String name, Expression expression)) in statement.declarations.indexed) {
      buffer.write(name);
      buffer.write(" = ");
      buffer.write(expression.acceptVisitor(this));

      if (index < statement.declarations.length - 1) {
        buffer.write(", ");
      }
    }
    buffer.writeln(";");

    return buffer.toString();
  }

  @override
  String visitWhileLoopStatement(WhileLoopStatement statement) =>
      "while (${statement.condition.acceptVisitor(this)}) ${statement.acceptVisitor(this)}";

  @override
  String visitGenericType(GenericType type) {
    var buffer = StringBuffer().safe();

    buffer.write(type.constructor.acceptVisitor(this));
    buffer.write("<");
    for (var (int i, TypeCode argument) in type.arguments.indexed) {
      buffer.write(argument.acceptVisitor(this));

      if (i < type.arguments.length - 1) {
        buffer.write(", ");
      }
    }
    buffer.write(">");

    return buffer.toString();
  }

  @override
  String visitLiteralType(LiteralType type) => type.literal.acceptVisitor(this);

  @override
  String visitNamespaceAccessType(NamespaceAccessType type) {
    var buffer = StringBuffer().safe();

    buffer.write(type.namespace.acceptVisitor(this));
    buffer.write(".");
    buffer.write(type.type.acceptVisitor(this));

    return buffer.toString();
  }

  @override
  String visitNullableType(NullableType type) {
    var buffer = StringBuffer().safe();

    buffer.write(type.subType.acceptVisitor(this));
    buffer.write("?");

    return buffer.toString();
  }

  @override
  String visitRecordType(RecordType type) {
    var buffer = StringBuffer().safe();

    buffer.write("(");
    if (type.positionalDeclarations case var positionalDeclarations?) {
      for (var (index, (type, name)) in positionalDeclarations.indexed) {
        buffer.write(type.acceptVisitor(this));
        if (name case var name?) {
          buffer.write(" ");
          buffer.write(name.acceptVisitor(this));
        }

        if (index < positionalDeclarations.length - 1 || positionalDeclarations.length == 1) {
          buffer.write(", ");
        }
      }
    }

    if (type.namedDeclarations case var namedDeclarations?) {
      if (type.positionalDeclarations != null) {
        buffer.write(", ");
      }

      buffer.write("{");
      for (var (index, (type, name)) in namedDeclarations.indexed) {
        buffer.write(type.acceptVisitor(this));
        buffer.write(" ");
        buffer.write(name.acceptVisitor(this));

        if (index < namedDeclarations.length - 1) {
          buffer.write(", ");
        }
      }
      buffer.write("}");
    }

    buffer.write(")");

    return buffer.toString();
  }
}

extension CodeBuilderExtension on Code {
  String toCodeString() => acceptVisitor(CodeBuilder());
}

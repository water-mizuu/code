// ignore_for_file: prefer_const_constructors, always_specify_types

import "dart:io";

import "package:code/code.dart";

Iterable<File> filesInLib() => //
    Directory("lib/src").listSync(recursive: true).whereType<File>();

void exportAll() {
  StringBuffer buffer = StringBuffer();
  for (File file in filesInLib()) {
    buffer.writeln('export "${file.path.split(Platform.pathSeparator).join("/").split("/").sublist(1).join("/")}";');
  }

  File("lib/code.dart").writeAsStringSync(buffer.toString());
}

void main(List<String> arguments) {
  exportAll();
  stdout.writeln(
    BlockFunctionStatement(
      returnType: RecordType(
        null,
        {
          ("int".identifier.type, "x".identifier),
          ("int".identifier.type, "y".identifier),
          ("int".identifier.type, "z".identifier),
        },
      ),
      name: "v".identifier,
      valueParameters: ValueParameters.withNamed(
        {
          ("int".identifier.type, "v".identifier),
        },
        {
          ("int".identifier.type, "c".identifier, defaultValue: LiteralExpression(3.literal), isRequired: true),
        },
      ),
      body: [
        BinaryExpression(3.literal.expression, BinaryOperator.plus, 4.literal.expression).statement,
        SwitchExpression("v".identifier.expression, {}).parenthesized.statement,
        ReturnStatement(
          SwitchExpression(
            "v".identifier.expression,
            {
              SwitchExpressionCase(
                RelationalPattern(BinaryOperator.greater, 0.pattern),
                ListExpression([
                  ContainerPatternConditionalExpression(
                    CallExpression(
                      "function".identifier.expression,
                      [],
                    ),
                    VariablePattern("name".identifier),
                    CallExpression(
                      "function".identifier.expression,
                      [],
                    ),
                  ),
                ]),
              ),
              SwitchExpressionCase(
                RelationalPattern(BinaryOperator.less, 0.pattern),
                (-1).literal.expression,
              ),
              SwitchExpressionCase(
                0.pattern,
                0.literal.expression,
              ),
            },
          ),
        ),
      ],
    ).toCodeString(),
  );
}

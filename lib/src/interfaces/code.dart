import "package:code/src/interfaces/visitor.dart";

abstract interface class Code {
  O acceptVisitor<O>(CodeVisitor<O> visitor);
}

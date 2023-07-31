extension IndentationExtension on String {
  String indent([int count = 1]) =>
      trimRight().split("\n").map((String v) => v.isEmpty ? v : "${"  " * count}$v").join("\n");

  String unindent() {
    if (this.isEmpty) {
      return this;
    }

    // Remove \r and \t
    String removed = this.trimRight().replaceAll("\r", "").replaceAll("\t", "    ");

    // Remove trailing right space.
    Iterable<String> lines = removed.split("\n").map((String line) => line.trimRight());

    // Unindent the string.
    int commonIndentation = lines //
        .where((String line) => line.isNotEmpty)
        .map((String line) => line.length - line.trimLeft().length)
        .reduce((int a, int b) => a < b ? a : b);

    Iterable<String> unindented = lines //
        .map((String line) => line.isEmpty ? line : line.substring(commonIndentation));

    return unindented.join("\n");
  }
}

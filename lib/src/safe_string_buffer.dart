// ignore_for_file: avoid_renaming_method_parameters

class SafeStringBuffer extends StringBuffer {
  @override
  void write(covariant String string) => super.write(string);

  @override
  void writeln([covariant String string = ""]) => super.writeln(string);

  @override
  void writeAll(covariant Iterable<String> strings, [String separator = ""]) => super.writeAll(strings, separator);
}

extension StringBufferExtension on StringBuffer {
  SafeStringBuffer safe() => SafeStringBuffer();
}

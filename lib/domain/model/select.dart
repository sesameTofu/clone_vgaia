class Select<T> {
  Select({
    this.id,
    this.title,
    this.suffix,
    this.value,
  });

  final int? id;
  final String? title;
  final String? suffix;
  T? value;
}

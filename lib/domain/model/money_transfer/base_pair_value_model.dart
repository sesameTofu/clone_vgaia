class BasePairValueModel {
  BasePairValueModel({
    this.key,
    this.value,
  });

  factory BasePairValueModel.fromMap(Map<String, dynamic> map) {
    return BasePairValueModel(
      key: map['key'] as String?,
      value: map['value'] as String?,
    );
  }

  String? key;
  String? value;
}

class EntrustTypeDetailBase {
  EntrustTypeDetailBase({
    this.id,
    this.entrustCode,
    this.detailCode,
  });

  EntrustTypeDetailBase.fromJson(Map<String, dynamic> json) {
    id = json['id'] as num?;
    entrustCode = json['entrustCode'] as num?;
    detailCode = json['detailCode'] as num?;
  }

  num? id;
  num? entrustCode;
  num? detailCode;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'entrustCode': entrustCode,
        'detailCode': detailCode,
      };
}

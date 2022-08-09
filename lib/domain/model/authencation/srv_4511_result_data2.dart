class Srv4511ResultData2 {
  Srv4511ResultData2({
    this.timeStamp2,
    this.id2,
    this.active2,
    this.od002,
    this.pd002,
    this.tr002,
    this.ri002,
    this.ko002,
    this.mg002,
    this.cb002,
    this.forgotPassword,
    this.status2,
    this.remarks2,
    this.updateFlag2,
  });

  factory Srv4511ResultData2.fromJson(Map<String, dynamic> json) =>
      Srv4511ResultData2(
          timeStamp2: json['timeStamp2'],
          id2: json['id2'],
          active2: json['active2'],
          od002: json['od002'],
          pd002: json['pd002'],
          tr002: json['tr002'],
          ri002: json['ri002'],
          ko002: json['ko002'],
          mg002: json['mg002'],
          cb002: json['cb002'],
          forgotPassword: json['forgotPassword'],
          status2: json['status2'],
          remarks2: json['remarks2'],
          updateFlag2: json['updateFlag2']);

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timeStamp2': timeStamp2,
        'id2': id2,
        'active2': active2,
        'od002': od002,
        'pd002': pd002,
        'tr002': tr002,
        'ri002': ri002,
        'ko002': ko002,
        'mg002': mg002,
        'cb002': cb002,
        'forgotPassword': forgotPassword,
        'status2': status2,
        'remarks2': remarks2,
        'updateFlag2': updateFlag2,
      };

  String? timeStamp2;
  String? id2;
  String? active2;
  String? od002;
  String? pd002;
  String? tr002;
  String? ri002;
  String? ko002;
  String? mg002;
  String? cb002;
  String? forgotPassword;
  String? status2;
  String? remarks2;
  String? updateFlag2;
}

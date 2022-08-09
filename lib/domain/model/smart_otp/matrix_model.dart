class MatrixModel {
  MatrixModel({this.colNumber, this.rowNumber, this.matchNumber, this.matric});

  factory MatrixModel.fromJson(Map<String, dynamic> json) => MatrixModel(
      colNumber: json['colNumber'],
      rowNumber: json['rowNumber'],
      matchNumber: json['matchNumber'],
      matric: json['matric']);

  final int? colNumber;

  final int? rowNumber;

  final int? matchNumber;

  final String? matric;
}

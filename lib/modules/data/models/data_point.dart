import 'dart:convert';

class DataPoint {
  final double value;
  final DateTime label;

  DataPoint(
    this.value,
    this.label,
  );

  DataPoint copyWith({
    double? value,
    DateTime? label,
  }) {
    return DataPoint(
      value ?? this.value,
      label ?? this.label,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'label': label.millisecondsSinceEpoch,
    };
  }

  factory DataPoint.fromMap(Map<String, dynamic> map) {
    return DataPoint(
      map['value'],
      DateTime.fromMillisecondsSinceEpoch(map['label']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DataPoint.fromJson(String source) =>
      DataPoint.fromMap(json.decode(source));

  @override
  String toString() => 'DataPoint(value: $value, label: $label)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataPoint && other.value == value && other.label == label;
  }

  @override
  int get hashCode => value.hashCode ^ label.hashCode;
}

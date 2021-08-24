import 'dart:convert';

class AppConfig {
  final String smsKey;
  final String smsSender;
  final String mailSender;
  final String mailgunDomain;
  final String mailgunKey;
  AppConfig({
    required this.smsKey,
    required this.smsSender,
    required this.mailSender,
    required this.mailgunDomain,
    required this.mailgunKey,
  });

  AppConfig copyWith({
    String? smsKey,
    String? smsSender,
    String? mailSender,
    String? mailgunDomain,
    String? mailgunKey,
  }) {
    return AppConfig(
      smsKey: smsKey ?? this.smsKey,
      smsSender: smsSender ?? this.smsSender,
      mailSender: mailSender ?? this.mailSender,
      mailgunDomain: mailgunDomain ?? this.mailgunDomain,
      mailgunKey: mailgunKey ?? this.mailgunKey,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'smsKey': smsKey,
      'smsSender': smsSender,
      'mailSender': mailSender,
      'mailgunDomain': mailgunDomain,
      'mailgunKey': mailgunKey,
    };
  }

  factory AppConfig.fromMap(Map<String, dynamic> map) {
    return AppConfig(
      smsKey: map['smsKey'],
      smsSender: map['smsSender'],
      mailSender: map['mailSender'],
      mailgunDomain: map['mailgunDomain'],
      mailgunKey: map['mailgunKey'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AppConfig.fromJson(String source) =>
      AppConfig.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AppConfig(smsKey: $smsKey, smsSender: $smsSender, mailSender: $mailSender, mailgunDomain: $mailgunDomain, mailgunKey: $mailgunKey)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppConfig &&
        other.smsKey == smsKey &&
        other.smsSender == smsSender &&
        other.mailSender == mailSender &&
        other.mailgunDomain == mailgunDomain &&
        other.mailgunKey == mailgunKey;
  }

  @override
  int get hashCode {
    return smsKey.hashCode ^
        smsSender.hashCode ^
        mailSender.hashCode ^
        mailgunDomain.hashCode ^
        mailgunKey.hashCode;
  }
}

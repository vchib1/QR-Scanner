enum QrType {
  text,
  mail,
  url,
  phone,
  sms;

  String get getName => name.substring(0, 1).toUpperCase() + name.substring(1);

  static QrType getQrType(String data) {
    switch (data.split(":").first) {
      case "tel":
        return QrType.phone;
      case "sms":
        return QrType.sms;
      case "mailto":
        return QrType.mail;
      case "http" || "https:" || "www":
        return QrType.url;
      default:
        return QrType.text;
    }
  }

  bool get canOpen => (this != QrType.text);
}

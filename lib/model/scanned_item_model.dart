class ScannedItem {
  final String? id;
  final String data;
  final DateTime createdAt;

  ScannedItem({this.id, required this.data, DateTime? createdAt})
    : createdAt = createdAt ?? DateTime.now();

  factory ScannedItem.fromMap(Map<String, dynamic> map) {
    return ScannedItem(
      id: map["id"] as String,
      data: map["data"] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        (map["createdAt"] as int) * 1000,
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "data": data,
      "createdAt": createdAt.millisecondsSinceEpoch,
    };
  }

  ScannedItem copyWith({String? id, String? data, DateTime? createdAt}) {
    return ScannedItem(
      id: id ?? this.id,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}

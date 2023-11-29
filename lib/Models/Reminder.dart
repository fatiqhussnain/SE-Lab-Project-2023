class Reminder{
  int? id;
  String label;
  int type;
  String date;
  String? createdAt;
  String? updatedAt;
  int active;

  Reminder({
    this.id,
    required this.label,
    required this.type,
    required this.date,
    required this.createdAt,
    required this.updatedAt,
    required this.active
  });

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    id: json["id"],
    label: json["label"],
    type: json["type"],
    date: json["date"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    active: json["active"]
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "type": type,
    "date": date,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "active": active
  };

}
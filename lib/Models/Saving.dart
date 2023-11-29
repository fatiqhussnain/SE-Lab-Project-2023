class Saving{
  int? id;
  double amount;
  int direction;
  String label;
  String description;
  String? createdAt;
  String? updatedAt;
  int active;

  Saving({
    this.id,
    required this.amount,
    required this.direction,
    required this.label,
    required this.description,
    this.createdAt,
    this.updatedAt,
    required this.active
  });

  factory Saving.fromJson(Map<String, dynamic> json) => Saving(
    id: json["id"],
    amount: json["amount"].toDouble(),
    direction: json["direction"],
    label: json["label"],
    description: json["description"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    active: json["active"]
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "direction": direction,
    "label": label,
    "description": description,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "active": active
  };

}
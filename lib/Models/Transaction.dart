class TransactionBL{
  int? id;
  int direction;
  String label;
  String description;
  double amount ;
  int type;
  String? createdAt;
  String? updatedAt;
  int active;

  TransactionBL({
    this.id,
    required this.direction,
    required this.label,
    required this.description,
    required this.amount,
    required this.type,
    this.createdAt,
    this.updatedAt,
    required this.active
  });

  factory TransactionBL.fromJson(Map<String, dynamic> json) => TransactionBL(
    id: json["id"],
    direction: json["direction"],
    label: json["label"],
    description: json["description"],
    amount: json["amount"].toDouble(),
    type: json["type"].toInt(),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    active: json["active"]
  );

  Map<String, dynamic> toJson() => {
    "direction": direction,
    "label": label,
    "description": description,
    "amount": amount,
    "type": type,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "active": active
  };

  @override
  String toString() {
    return "TransactionBL(id: $id, direction: $direction, label: $label, description: $description, amount: $amount, type: $type, createdAt: $createdAt, updatedAt: $updatedAt, active: $active)";
  }
}
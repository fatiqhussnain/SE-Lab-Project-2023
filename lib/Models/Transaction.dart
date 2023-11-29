class Transaction{
  int? id;
  int direction;
  String label;
  String description;
  double amount ;
  String type;
  String? createdAt;
  String? updatedAt;
  int active;

  Transaction({
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

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
    id: json["id"],
    direction: json["direction"],
    label: json["label"],
    description: json["description"],
    amount: json["amount"].toDouble(),
    type: json["type"],
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
}
class Transfer{
  int? id;
  int direction;
  String name;
  String description;
  double amount ;
  String? createdAt;
  String? updatedAt;
  int active;

  Transfer({
    this.id,
    required this.direction,
    required this.name,
    required this.description,
    required this.amount,
    this.createdAt,
    this.updatedAt,
    required this.active
  });

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
    id: json["id"],
    direction: json["direction"],
    name: json["name"],
    description: json["description"],
    amount: json["amount"].toDouble(),
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    active: json["active"]
  );

  Map<String, dynamic> toJson() => {
    "direction": direction,
    "name": name,
    "description": description,
    "amount": amount,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "active": active
  };
}
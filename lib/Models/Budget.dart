class Budget {
  int? id;
  String label;
  String iconString;
  double amount;
  String? createdAt;
  String? updatedAt;
  int active;

  Budget({
    this.id,
    required this.label,
    required this.iconString,
    required this.amount,
    this.createdAt,
    this.updatedAt,
    required this.active,
  });

  factory Budget.fromJson(Map<String, dynamic> json) => Budget(
    id: json["id"],
    label: json["label"],
    iconString: json["icon_string"],
    amount: json["amount"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "icon_string": iconString,
    "amount": amount,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "active": active,
  };

}
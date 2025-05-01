class Tool {
  final String name;
  final String icon;
  bool isSelected;

  Tool({
    required this.name,
    required this.icon,
    this.isSelected = false,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      name: json['name'],
      icon: json['icon'],
    );
  }
}

class LanguageIcon {
  final String name;
  final String iconName;

  LanguageIcon({required this.name, required this.iconName});

  factory LanguageIcon.fromJson(Map<String, dynamic> json) {
    return LanguageIcon(
      name: json['name'],
      iconName: json['icon'],
    );
  }
}

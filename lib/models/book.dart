class Book {
  final int id;
  final String name;
  final String type;
  final bool available;

  Book({
    required this.id,
    required this.name,
    required this.type,
    required this.available,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      available: json['available'] == 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'available': available ? 1 : 0,
    };
  }
}

class TaskItem {
  int? id;
  String title;
  String priority;
  String description;
  bool isCompleted;

  TaskItem({
    this.id,
    required this.title,
    required this.priority,
    required this.description,
    this.isCompleted = false,
  });

  Map<String, dynamic> toJson() {
    final map = {
      'title': title,
      'priority': priority,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };

    return map;
  }

  factory TaskItem.fromJson(Map<String, dynamic> json) {
    return TaskItem(
      id: json['id'] is int ? json['id'] : int.tryParse('${json['id']}'),
      title: json['title'] ?? '',
      priority: json['priority'] ?? 'Normal',
      description: json['description'] ?? '',
      isCompleted: (json['isCompleted'] == 1 || json['isCompleted'] == true),
    );
  }
}

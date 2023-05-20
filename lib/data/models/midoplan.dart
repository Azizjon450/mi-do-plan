class MidoPlan {
  final String id;
  final String title;
  final String userId;
  bool isDone;

  MidoPlan({
    required this.id,
    required this.title,
    required this.userId,
    this.isDone = false,
  });
}

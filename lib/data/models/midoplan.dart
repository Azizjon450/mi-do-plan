class MidoPlan {
  final String id;
  final String title;
  bool isDone;

  MidoPlan({
    required this.id,
    required this.title,
    this.isDone = false,
  });
}

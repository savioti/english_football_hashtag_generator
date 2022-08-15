class HashtagDataEntity {
  final String term;
  final List<String> hashtags;

  HashtagDataEntity({
    required this.term,
    required this.hashtags,
  });

  @override
  bool operator ==(Object other) {
    return other is HashtagDataEntity && other.term == term;
  }

  @override
  int get hashCode => term.hashCode;
}

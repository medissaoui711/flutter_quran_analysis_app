class Analysis {
  final String morphology;
  final String tafsir;
  final String grammar;
  final List<String> themes;
  final String semantic;
  final List<String> connections;
  final String translation;
  final String audio;
  final String importance;

  Analysis({
    required this.morphology,
    required this.tafsir,
    required this.grammar,
    required this.themes,
    required this.semantic,
    required this.connections,
    required this.translation,
    required this.audio,
    required this.importance,
  });

  factory Analysis.fromJson(Map<String, dynamic> json) {
    return Analysis(
      morphology: json['morphology'],
      tafsir: json['tafsir'],
      grammar: json['grammar'],
      themes: List<String>.from(json['themes']),
      semantic: json['semantic'],
      connections: List<String>.from(json['connections']),
      translation: json['translation'],
      audio: json['audio'],
      importance: json['importance'],
    );
  }
}
import 'package:flutter/material.dart';
import '../models/analysis.dart';

class AnalysisScreen extends StatelessWidget {
  final Analysis analysis;

  const AnalysisScreen({required this.analysis, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('نتيجة التحليل')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('التحليل النحوي: ${analysis.morphology}'),
              Text('التفسير: ${analysis.tafsir}'),
              Text('الجرامر: ${analysis.grammar}'),
              Text('المواضيع: ${analysis.themes.join(', ')}'),
              Text('الشرح الدلالي: ${analysis.semantic}'),
              Text('الاتصالات: ${analysis.connections.join(', ')}'),
              Text('الترجمة: ${analysis.translation}'),
              Text('رابط الصوت: ${analysis.audio}'),
              Text('أهمية الكلمة: ${analysis.importance}'),
            ],
          ),
        ),
      ),
    );
  }
}

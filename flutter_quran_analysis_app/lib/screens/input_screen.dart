import 'package:flutter/material.dart';
import '../api/sonnet_api.dart';
import 'analysis_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InputScreenState createState() => _InputScreenState();
}

// ignore: library_private_types_in_public_api
class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();

  void analyzeText() async {
    final inputText = _controller.text;
    if (inputText.isNotEmpty) {
      final analysis = await SonnetApi.analyzeText(inputText);
      // التأكد من أن الـ widget لا يزال جزءًا من شجرة الواجهات قبل استخدام الـ context
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AnalysisScreen(analysis: analysis),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أدخل نص القرآن')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'أدخل آية أو كلمة',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: analyzeText,
              child: const Text('تحليل'),
            ),
          ],
        ),
      ),
    );
  }
}

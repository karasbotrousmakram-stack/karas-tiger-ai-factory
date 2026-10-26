import 'package:flutter/material.dart';

void main() {
  runApp(const KarasAIFactory());
}

class KarasAIFactory extends StatelessWidget {
  const KarasAIFactory({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KARAS THE TIGER AI FACTORY',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF101010),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFFC107),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const FactoryHome(),
    );
  }
}

class FactoryHome extends StatefulWidget {
  const FactoryHome({super.key});

  @override
  State<FactoryHome> createState() => _FactoryHomeState();
}

class _FactoryHomeState extends State<FactoryHome> {
  final TextEditingController _promptController = TextEditingController();
  final List<String> _projects = [];

  String _platform = 'Android APK';

  void _createProject() {
    final prompt = _promptController.text.trim();

    if (prompt.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('اكتب وصف التطبيق الأول')),
      );
      return;
    }

    setState(() {
      _projects.insert(0, prompt);
      _promptController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'تم تسجيل فكرة المشروع. توليد الكود وبناء APK يحتاجان ربط خدمات إضافية.',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A1A),
        title: const Text(
          'KARAS THE TIGER AI FACTORY',
          style: TextStyle(
            color: Color(0xFFFFC107),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const SizedBox(height: 15),
          const Icon(
            Icons.smart_toy,
            color: Color(0xFFFFC107),
            size: 75,
          ),
          const SizedBox(height: 12),
          const Text(
            'مصنع كاراس النمر للذكاء الاصطناعي',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFC107),
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'اكتب فكرتك وحوّلها إلى مشروع تطبيق',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white70, fontSize: 15),
          ),
          const SizedBox(height: 28),
          const Text(
            'وصف التطبيق الذي تريد إنشاءه',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _promptController,
            minLines: 4,
            maxLines: 7,
            decoration: InputDecoration(
              hintText: 'مثال: أنشئ تطبيق تعليم بالذكاء الاصطناعي...',
              filled: true,
              fillColor: const Color(0xFF202020),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  color: Color(0xFFFFC107),
                  width: 2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          DropdownButtonFormField<String>(
            value: _platform,
            decoration: InputDecoration(
              labelText: 'نوع المشروع',
              filled: true,
              fillColor: const Color(0xFF202020),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: 'Android APK',
                child: Text('تطبيق Android APK'),
              ),
              DropdownMenuItem(
                value: 'Flutter',
                child: Text('مشروع Flutter'),
              ),
              DropdownMenuItem(
                value: 'Web',
                child: Text('موقع ويب'),
              ),
            ],
            onChanged: (value) {
              if (value != null) {
                setState(() => _platform = value);
              }
            },
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 54,
            child: ElevatedButton.icon(
              onPressed: _createProject,
              icon: const Icon(Icons.add_circle_outline),
              label: const Text(
                'إنشاء مشروع جديد',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const Divider(color: Color(0xFFFFC107)),
          const Text(
            'مشاريعي',
            style: TextStyle(
              color: Color(0xFFFFC107),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          if (_projects.isEmpty)
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'مشاريعك الجديدة هتظهر هنا',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white54),
              ),
            ),
          ..._projects.map(
            (project) => Card(
              color: const Color(0xFF202020),
              child: ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  color: Color(0xFFFFC107),
                ),
                title: Text(project),
                subtitle: Text('النوع: $_platform'),
              ),
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'KARAS THE TIGER',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFFC107),
              letterSpacing: 3,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

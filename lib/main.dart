
import 'package:flutter/material.dart';

void main() => runApp(const RudrSurveyorApp());

class RudrSurveyorApp extends StatelessWidget {
  const RudrSurveyorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RUDR SURVEYOR',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFDAB04A),
        scaffoldBackgroundColor: const Color(0xFFF6F7F9),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final pages = const [
    DashboardPage(),
    MeasurementPage(),
    CalculatorPage(),
    KnowledgePage(),
    ReportPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (i) => setState(() => index = i),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'હોમ'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'માપણી'),
          NavigationDestination(icon: Icon(Icons.calculate_outlined), selectedIcon: Icon(Icons.calculate), label: 'Calculator'),
          NavigationDestination(icon: Icon(Icons.school_outlined), selectedIcon: Icon(Icons.school), label: 'Knowledge'),
          NavigationDestination(icon: Icon(Icons.description_outlined), selectedIcon: Icon(Icons.description), label: 'Report'),
        ],
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override
  Widget build(BuildContext context) => _Page(
    title: 'RUDR SURVEYOR',
    child: Column(
      children: [
        Image.asset('assets/rudr_logo.png', height: 180),
        const SizedBox(height: 12),
        const Text('Land Measurement & Survey', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        const _Card(icon: Icons.map, title: 'Land Measurement', subtitle: 'જમીન માપણી'),
        const _Card(icon: Icons.calculate, title: 'Area Calculator', subtitle: 'ક્ષેત્રફળ ગણતરી'),
        const _Card(icon: Icons.straighten, title: 'Unit Converter', subtitle: 'એકમ રૂપાંતર'),
        const _Card(icon: Icons.phone, title: 'Customer Care', subtitle: '8487847474'),
      ],
    ),
  );
}

class MeasurementPage extends StatelessWidget {
  const MeasurementPage({super.key});
  @override
  Widget build(BuildContext context) => _Page(
    title: 'Land Measurement / જમીન માપણી',
    child: Column(children: const [
      _Input(label: 'Length / લંબાઈ'),
      _Input(label: 'Width / પહોળાઈ'),
      _Input(label: 'Unit / એકમ'),
      SizedBox(height: 12),
      _ActionButton(text: 'Calculate Area / ક્ષેત્રફળ ગણો'),
    ]),
  );
}

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});
  @override
  Widget build(BuildContext context) => _Page(
    title: 'Area Calculator / ક્ષેત્રફળ',
    child: Column(children: const [
      _Card(icon: Icons.crop_square, title: 'Rectangle', subtitle: 'લંબાઈ × પહોળાઈ'),
      _Card(icon: Icons.change_history, title: 'Triangle', subtitle: '½ × base × height'),
      _Card(icon: Icons.circle_outlined, title: 'Circle', subtitle: 'π × r²'),
      _Card(icon: Icons.polyline, title: 'Polygon', subtitle: 'Survey points'),
      _Card(icon: Icons.swap_horiz, title: 'Unit Converter', subtitle: 'Acre • Guntha • Bigha • Sq.m • Sq.ft'),
    ]),
  );
}

class KnowledgePage extends StatelessWidget {
  const KnowledgePage({super.key});
  @override
  Widget build(BuildContext context) => _Page(
    title: 'Surveyor Knowledge / માહિતી',
    child: const Column(children: [
      _Info(title: 'Land Units', text: 'Acre, Guntha, Bigha, Hectare, Square Meter, Square Feet.'),
      _Info(title: 'Survey Basics', text: 'Boundary, bearing, distance, area and survey points.'),
      _Info(title: 'Field Checklist', text: 'Equipment, reference points, measurements and notes.'),
      _Info(title: 'Report Tips', text: 'Record date, customer, location, measurements and final area.'),
    ]),
  );
}

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});
  @override
  Widget build(BuildContext context) => _Page(
    title: 'Survey Report / સર્વે રિપોર્ટ',
    child: Column(children: const [
      _Input(label: 'Customer Name / ગ્રાહકનું નામ'),
      _Input(label: 'Survey Date / તારીખ'),
      _Input(label: 'Village / ગામ'),
      _Input(label: 'Survey Details / માપણી વિગતો'),
      SizedBox(height: 12),
      _ActionButton(text: 'Create Report / રિપોર્ટ બનાવો'),
    ]),
  );
}

class _Page extends StatelessWidget {
  final String title;
  final Widget child;
  const _Page({required this.title, required this.child});
  @override
  Widget build(BuildContext context) => SafeArea(
    child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        const SizedBox(height: 18),
        child,
      ]),
    ),
  );
}

class _Card extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  const _Card({required this.icon, required this.title, required this.subtitle});
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(
      leading: Icon(icon, size: 30),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    ),
  );
}

class _Input extends StatelessWidget {
  final String label;
  const _Input({required this.label});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: TextField(decoration: InputDecoration(labelText: label, border: const OutlineInputBorder())),
  );
}

class _ActionButton extends StatelessWidget {
  final String text;
  const _ActionButton({required this.text});
  @override
  Widget build(BuildContext context) => SizedBox(
    width: double.infinity,
    child: FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.calculate), label: Text(text)),
  );
}

class _Info extends StatelessWidget {
  final String title, text;
  const _Info({required this.title, required this.text});
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: ListTile(title: Text(title), subtitle: Text(text)),
  );
}

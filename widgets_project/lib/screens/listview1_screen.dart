import 'package:flutter/material.dart';
import 'package:widgets_project/themes/app_theme.dart';

//Si al començar amb un file en blanc escrivim fl ja tindrem el snippet per crear un nou widget
class Listview1Screen extends StatelessWidget {
  
  final List<String> options = const ['Estanislau', 'Carmeta', 'Dani Mació', 'Vamoxavaleh', 'Conradconsum'];

  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView tipus 1'),
      ),
      body: ListView(
        children: [
          ...options.map((str) => ListTile(
            title: Text(str),
            trailing: const Icon(Icons.arrow_forward_ios_outlined, color: AppTheme.mainColor),
          )).toList(),
          //D'aquesta manera creem tans listiles com noms a la llista options
        ]
      ),
    );
  }
}
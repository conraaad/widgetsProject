import 'package:flutter/material.dart';
import 'package:widgets_project/themes/app_theme.dart';

//Si al començar amb un file en blanc escrivim fl ja tindrem el snippet per crear un nou widget
class Listview2Screen extends StatelessWidget {
  
  final List<String> options = const ['Estanislau', 'Carmeta', 'Dani Mació', 'Vamoxavaleh', 'Conradconsum'];

  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView tipus 2'),
      ),
      //aqui fem servir un constructor amb nom que te listView, va carregant els listtiles de mica en mica 
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(options[index]),
          trailing: const Icon(Icons.arrow_forward_ios_outlined, color: AppTheme.mainColor),
          onTap: () {
            //print(options[index]);
          },
        ),
        //les dos ralles de sota significa que hi han dos parametres q no farem servir
        separatorBuilder: (_, __) => const Divider(),
      ),
    );
  }
}
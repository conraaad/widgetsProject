import 'package:flutter/material.dart';

import 'package:widgets_project/router/app_routes.dart';
import 'package:widgets_project/themes/app_theme.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elements de Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          title: Text(AppRoutes.menuOptions[index].name),
          leading: Icon(AppRoutes.menuOptions[index].icon, color: AppTheme.mainColor),
          onTap: () {
            /*
            final route = MaterialPageRoute(builder: (context) => const Listview1Screen());
            Navigator.push(context, route);
            */
            //Navigator.pushReplacement(context, route);
            //pushReplacement per quan no volem la opcio de tornar enrere, destrueix la ruta
            //es util per ex quan fem un login

            Navigator.pushNamed(context, AppRoutes.menuOptions[index].route);

          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: AppRoutes.menuOptions.length,
      ),
    );
  }
}
import 'package:flutter/material.dart';

import 'package:widgets_project/themes/app_theme.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      shadowColor: AppTheme.mainColor,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const ListTile(
              leading: Icon(Icons.call_rounded, color: AppTheme.mainColor),
              title: Text('Aqui un titol'),
              subtitle: Text('Velit eiusmod esse ullamco adipisicing labore veniam non dolore enim proident elit quis consequat pariatur.'),
            ),
            
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    //style del button centralitzat a AppTheme
                    //style: TextButton.styleFrom(foregroundColor: AppTheme.mainColor),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {},
                    //style: TextButton.styleFrom(foregroundColor: AppTheme.mainColor),
                    child: const Text('Ok'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
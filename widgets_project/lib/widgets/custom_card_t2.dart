
import 'package:flutter/material.dart';

import 'package:widgets_project/themes/app_theme.dart';

class CustomCardType2 extends StatelessWidget {
  
  final String imageUrl;
  final String? footageText;

  const CustomCardType2({super.key, required this.imageUrl, this.footageText});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,   //si el fill surt de la zona retalla'l
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)
      ),
      elevation: 30,
      shadowColor: AppTheme.mainColor,
      child: Column(
        children: [
          /*
          Image(
            image: NetworkImage('https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg')
          )
          */

          //FadeInImage serveix per a deixar veure un loading mentre es carrega
          FadeInImage(
            image: NetworkImage(imageUrl),
            placeholder: const AssetImage('assets/loading_Blue.gif'),
            width: double.infinity, //agafem el maxim possible
            height: 310,
            fit: BoxFit.cover,
          ),

          //Mira que interessant dart => ens deixa fer aixo 

          if (footageText != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 15, top: 10, bottom: 10),
              child: Text(footageText!),  //! significa que li dius a Dart que confii en tu, aqui sabem que no sera null, ja que sino ja no entrara
            )

        ],
      ),
    );
  }
}
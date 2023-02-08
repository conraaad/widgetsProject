import 'package:flutter/material.dart';

import 'package:widgets_project/widgets/widgets.dart';

class CardScreen extends StatelessWidget {
   
  const CardScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://iso.500px.com/wp-content/uploads/2014/07/big-one.jpg', footageText: 'Gran Teton, US'),

          //aquesta carta li enviem un null com a nom, per tant no es pintara la zona del text
          SizedBox(height: 20),
          CustomCardType2(footageText: null, imageUrl: 'https://i0.wp.com/www.unblogdepalo.com/wp-content/uploads/2021/03/landscape-mountains-sky-4843193.jpg?fit=1280%2C853&ssl=1'),

          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://fotoarte.com.uy/wp-content/uploads/2019/03/Landscape-fotoarte.jpg', footageText: 'Dolomiti, Italy'),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://images.squarespace-cdn.com/content/v1/59523d5c4c8b031b6d9dcb5b/1645865436351-NF1WX4AHJUE43OZ3GJCY/_S6A1420-Edit-Edit.jpg?format=2500w', footageText: 'Rocky Mountains, Canada'),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://photographylife.com/wp-content/uploads/2016/06/Mass.jpg', footageText: 'Black Beach, Island'),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://jakubpolomski.com/wp-content/gallery/switzerland/matterhorn-switzerland-landscape-120700ALP2085.jpg', footageText: 'Matterhorn, Switzerland'),
          SizedBox(height: 50),
        ],
      )
    );
  }
}



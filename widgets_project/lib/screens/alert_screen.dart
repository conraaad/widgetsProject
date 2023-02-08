import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
   
  const AlertScreen({Key? key}) : super(key: key);
  
  void displayDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,     //Serveix per poder tancar el dialog a partir de tocar l'ombra
      context: context, 
      builder: (context) => AlertDialog(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text('Alerta Parla Català'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Això es un avis, parla català collons'),

            FadeInImage(
              image: NetworkImage('https://pbs.twimg.com/profile_images/830545227773513728/tNztAwHe_400x400.jpg'),
              placeholder: AssetImage('assets/loading_Blue.gif'),
            ),

          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),    //aixo serveix pq es com si posesim una screen a sobre, amb aixo la destrueix 
            child: const Text('Cancel'),
          )
        ],
      ),
    );
  }

  void displayCupertinoDialog(BuildContext context) {
    showCupertinoDialog(
      context: context, 
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Alerta Parla Català'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text('Això es un avis, parla català collons'),

            SizedBox(height: 10),

            FlutterLogo(size: 100),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),    //aixo serveix pq es com si posesim una screen a sobre, amb aixo la destrueix 
            child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 4, 97, 204))),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),    //aixo serveix pq es com si posesim una screen a sobre, amb aixo la destrueix 
            child: const Text('OK', style: TextStyle(color: Color.fromARGB(255, 4, 97, 204))),
          )
        ],
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Screen')
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.close),
        //TIP => si deixem el onPressed a null, queda el boto com desactivat
        onPressed: () {
          Navigator.pop(context);
        }
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            //aqui desplegarem la alerta/dialog
            if (!Platform.isAndroid) {
              displayDialog(context);
            } 
            else {
              displayCupertinoDialog(context);
            }
          }, 
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text('Mostrar Alerta', style: TextStyle(fontSize: 20)),
          ),
        )
      ),
    );
  }
}
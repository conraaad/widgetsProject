import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {

  final String? hintText;
  final String? labelText;
  final String? helperText;
  final IconData? suffixIcon;
  final TextInputType inputType;
  final bool isPassword;
  final String? Function(String?)? valida;

  final String formProperty;
  final Map<String, String> formValues;     //s'envia per referencia per tant es com si estiguessim editant el mateix que te a la classe inputsScreen

  const CustomInputField({
    super.key, 
    this.hintText, 
    this.labelText, 
    this.helperText, 
    this.suffixIcon, 
    this.valida, 
    this.isPassword = false,              //si me l'envien sera el que enviin sino sera per defecte false
    required this.inputType, 
    required this.formProperty, 
    required this.formValues, 
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: false,
      //textCapitalization: TextCapitalization.words,   //Serveix per ex per que cada paraula s'autocompleti amb majuscula
      keyboardType: inputType,                        //Serveix per a que cada input es desplegui el tipus de teclat que toqui
      obscureText: isPassword,
      onChanged: (value) {
        formValues[formProperty] = value;
        print('$formProperty: $formValues');
      },
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        helperText: helperText,
        //counterText: '',
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
        prefixIcon: suffixIcon == null ? null : Icon(suffixIcon),
      ),

      validator: valida,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
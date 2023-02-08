import 'package:flutter/material.dart';
import 'package:widgets_project/widgets/widgets.dart';

class InputsScreen extends StatelessWidget {
   
  const InputsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    //aqui creem una global key que referenciara una key de tipus FormState
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    //mapa amb els valors de tots els camps
    final Map<String, String> formValues = {
      'username' : '',
      'email' : '',
      'mobile' : '',
      'password' : '',
      'role' : 'admin',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inputs Form'),
      ),
      //SingleChildView serveix per per exemple el cas d'un formulari, que apareix el teclat virtual per sota
      //i necessites que el contingut faci scroll per poder veure-hi
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Form(
            key: formKey,       //Les keys serveixen guardar la referencia 
            child: Column(
              children: [
          
                CustomInputField(
                  inputType: TextInputType.name,
                  hintText: 'Enter your user name', 
                  labelText: 'User name', 
                  suffixIcon: Icons.person,
                  helperText: '3 characters needed',
                  valida: (value) {
                    if (value == null) return 'This field is required';
                    return value.isEmpty ? 'This field is required' : null;
                  },
                  formProperty: 'username',
                  formValues: formValues,
                ),
          
                const SizedBox(height: 20),
          
                CustomInputField(
                  inputType: TextInputType.emailAddress,
                  hintText: 'Enter your email', 
                  labelText: 'Email', 
                  suffixIcon: Icons.email, 
                  helperText: 'Valid email needed',
                  valida: (value) {
                    if (value == null) return 'This field is required';
                    return value.length < 9 ? 'Minimum 9 characters' : null;
                  },
                  formProperty: 'email',
                  formValues: formValues,
                ),
          
                const SizedBox(height: 20),
          
                CustomInputField(
                  inputType: TextInputType.phone,
                  hintText: 'Enter your mobile number', 
                  labelText: 'Mobile number', 
                  suffixIcon: Icons.call, 
                  helperText: '9 characters needed',
                  valida: (value) {
                    if (value == null) return 'This field is required';
                    return value.length < 9 ? 'Minimum 9 characters' : null;
                  },
                  formProperty: 'mobile',
                  formValues: formValues,
                ),
          
                const SizedBox(height: 20),
          
                CustomInputField(
                  inputType: TextInputType.text,
                  isPassword: true,
                  hintText: 'Enter your password', 
                  labelText: 'Password', 
                  suffixIcon: Icons.lock, 
                  helperText: '9 characters needed',
                  valida: (value) {
                    if (value == null) return 'This field is required';
                    return value.length < 9 ? 'Minimum 9 characters' : null;
                  },
                  formProperty: 'password',
                  formValues: formValues,
                ),
          
                const SizedBox(height: 20),

                DropdownButtonFormField(
                  value: 'admin',
                  hint: const Text('Role'),
                  items: const [
                    DropdownMenuItem(value: 'admin', child: Text('Admin')),
                    DropdownMenuItem(value: 'superUser', child: Text('Super User')),
                    DropdownMenuItem(value: 'junior', child: Text('Junior')),
                    DropdownMenuItem(value: 'becari', child: Text('Becari')),
                  ], 
                  onChanged: (value) {
                    formValues['role'] = value ?? 'user';
                  }
                ),
          
                /*

                TextFormField(
                  autofocus: false,
                  textCapitalization: TextCapitalization.words,   //Serveix per ex per que cada paraula s'autocompleti amb majuscula
                  onChanged: (value) {
                    //Algo a fer
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your city',
                    labelText: 'User City',
                    helperText: '3 characters needed',
                    //counterText: '',
                    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    //prefixIcon: Icon(Icons.person),
                    icon: Icon(Icons.location_city_rounded),
                  ),
          
                  validator: (value) {
                    if (value == null) return 'This field is required';
                    return value.length < 3 ? 'Minimum 3 characters' : null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                */

                const SizedBox(height: 30),
          
                ElevatedButton(
                  onPressed: () {

                    //FocusScope.of(context).requestFocus(FocusNode());   //Serveix per minimitzar el teclat
                    FocusManager.instance.primaryFocus?.unfocus();

                    if (!formKey.currentState!.validate()) {
                      print('Form no valid');
                      return;
                    }
                    print("Save -> HTTP petition: $formValues");
                  }, 
                  child: const SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: Center(child: Text('Save', style: TextStyle(fontSize: 16)))
                  )
                )
          
              ],
            ),
          ),
        ),
      )
    );
  }
}

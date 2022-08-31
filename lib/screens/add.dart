

import 'package:flutter/material.dart';
import 'package:states_widgets_routes/models/languege.dart';

class AddLanguage extends StatefulWidget {
  const AddLanguage({Key? key}) : super(key: key);

final Text title = const Text("Nova Linguagem");
final _formKey = GlobalKey<FormState>();
final TextEditingController _nameController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();

  @override
  widget build(BuildContext context){
return Scaffold(
  appBar: AppBar(title: title),
  body: const Padding(
    padding: padding,
    child: Form(
      key: _formKey,
      child: Collumn(
        CrossAxisAlignment: CrossAxisAlignment.start,
        children:[
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Nome da Linguagem",
              labelText: "Nome da Linguagem",
            ),
            controller: _nameController,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Insira o nome da Linguagem";
              }
              return null;
            },
        ,)
        TextFormField(
            decoration: const InputDecoration(
              hintText: "Descrição da Linguagem",
              labelText: "Descrição da Linguagem",
            ),
            controller: _nameController,
            validator: (value){
              if(value == null || value.isEmpty){
                return "Insira o descrição da Linguagem";
              }
              return null;
            },
        ,)
          Padding(
            padding: const EdgeInsets.only(top:16),
            child: ElevatedButton( 
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Language language = Language(_nameController.text, 
                      _descriptionController.text);
                      Nacigator.pop(context, language);
                  }
                },
                child: const Text("Gravar")), 
          )
        ]))),


);


  }

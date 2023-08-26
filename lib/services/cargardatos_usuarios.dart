import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/clientes.dart';
import '../presentation/screens/view_clientes_screen.dart';

Widget cargarDatos(){
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection('Usuarios').snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
      //print(snapshot.connectionState);
      switch(snapshot.connectionState){
        case ConnectionState.waiting: 
          return const Center(
            child: CircularProgressIndicator(),
          );
        case ConnectionState.active: 
          if(snapshot.hasError) return const Text('error');
          return snapshot.data != null? ViewClientScreen(cliente:conversiondelista(snapshot.data!.docs)): const Text('Sin datos');
        default: return const Text('Presiona el boton para recargar');
      }
    }
  );
}

List<Cliente> conversiondelista(List registro){
  List<Cliente> resultado = [];
  for (var i = 0; i < registro.length; i++) {
    resultado.add(Cliente(id: registro[i]['Id'], nombre: registro[i]['Nombre'], telefono: registro[i]['Telefono'], correo: registro[i]['Correo'], rol: registro[i]['Rol'], password: registro[i]['Password']));
  }
  return resultado;
}
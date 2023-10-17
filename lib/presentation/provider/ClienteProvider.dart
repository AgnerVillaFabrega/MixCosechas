import 'package:flutter/foundation.dart';
import 'package:mixcosechas_app/model/clientes.dart';

class ClienteProvider with ChangeNotifier {
  Cliente _cliente = Cliente(
    id: 'No autenticado',
    nombre: 'No autenticado',
    telefono: 'No autenticado',
    correo: 'No autenticado',
    rol: 'No autenticado',
    password: 'No autenticado',
  );

  Cliente get cliente => _cliente;

  Future<void> setCli({required Cliente cli}) async{
    _cliente = cli;
    notifyListeners();
  }

  // void setCliente(Cliente cliente) {
  //   _cliente = cliente;
  //   notifyListeners();
  // }

}

import 'dart:io';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path/path.dart';
//helper para la base de datos
class BDHelper{
  static Database? _baseDatos;
  static const String nombreBD = "BDResultados.db";

  //iniciar la base de datos
  Future<Database?> get baseDatos async{
    if(_baseDatos != null){
      return _baseDatos;
    }
    _baseDatos = await _inicializarBD();
    return _baseDatos;
  }

  //consultar la tabla entera en la base de datos
  Future<List<Map<String, dynamic>>> consultarBD(String tabla) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.query(tabla);
    return resultado;
  }

  //consulta con sql
  ///Permite consultar la base de datos con sentencias SQL
  Future<List<Map<String, dynamic>>> consultarSQL(String sql) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.rawQuery(sql);
    return resultado;
  }

  //insertar datos en la base de datos
  Future<int> insertarBD(String tabla, Map<String, dynamic> fila) async{
    Database? bd= await baseDatos;
    var resultado = await bd!.insert(tabla, fila);
    return resultado;
  }

  //eliminar datos de la base de datos
  Future<int> eliminarBD(String tabla, int id) async{
    Database? bd = await baseDatos;
    var resultado = await bd!.delete(tabla, where: 'id = ?', whereArgs: [id]);
    return resultado;
  }

  //actualizar datos de la base de datos
  Future<int> actualizarBD(String tabla, Map<String, dynamic> fila) async{
    Database? bd = await baseDatos;
    var resultado=0;
    if (bd!=null)
    {
      resultado = await bd.update(tabla, fila, where: 'id = ?', whereArgs: [fila['id']]);
    }
    
    return resultado;
  }

  

  _inicializarBD() async{
    var directorio = await getDatabasesPath();
    String path = directorio + nombreBD;
    var baseDatos = await openDatabase(
      path, 
      version: 1, 
      onCreate: (Database db, int version) async{
        await db.execute(
          "CREATE TABLE IF NOT EXISTS Resultados(id INTEGER PRIMARY KEY, jugador1 TEXT, j1set1 TEXT, j1set2 TEXT, j1set3 TEXT, j1set4 TEXT, j1set5 TEXT, jugador2 TEXT, j2set1 TEXT, j2set2 TEXT, j2set3 TEXT, j2set4 TEXT, j2set5 TEXT)"
        );
        //para añadir una segunda tabla
        // await db.execute(
        //   "CREATE TABLE Resultados(id INTEGER PRIMARY KEY, jugador1 TEXT, j1set1 TEXT, j1set1 TEXT)"
        // );
      }
      );
    return baseDatos;
  }


}
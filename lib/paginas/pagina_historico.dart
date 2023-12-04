import 'package:flutter/material.dart';
import 'package:marcador_flutter/modelo/base_datos.dart';

class PaginaHistorico extends StatelessWidget {
  final BDHelper bdHelper=BDHelper();
  PaginaHistorico({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historico"),
      ),
      body: FutureBuilder(
        future: bdHelper.consultarBD("Resultados"), 
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if(snapshot.hasData)
          {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]["jugador1"]+" vs "+snapshot.data![index]["jugador2"]),
                  subtitle: Row(
                    children: [
                      Text(snapshot.data![index]["j1set1"]+"-"+snapshot.data![index]["j2set1"]+" "+
                          snapshot.data![index]["j1set2"]+"-"+snapshot.data![index]["j2set2"]+" "),
                      if((snapshot.data![index]["j1set3"]!="0")||(snapshot.data![index]["j2set3"]!="0"))
                        Text(snapshot.data![index]["j1set3"]+"-"+snapshot.data![index]["j2set3"]+" "),
                      if((snapshot.data![index]["j1set4"]!="0")||(snapshot.data![index]["j2set4"]!="0"))                                      
                        Text(snapshot.data![index]["j1set4"]+"-"+snapshot.data![index]["j2set4"]+" "),
                      if((snapshot.data![index]["j1set5"]!="0")||(snapshot.data![index]["j2set5"]!="0"))
                        Text(snapshot.data![index]["j1set5"]+"-"+snapshot.data![index]["j2set5"]),
                    ],
                  ),
                );
              },
            );
          }
          else
          {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        }

      )
    );
  }
}
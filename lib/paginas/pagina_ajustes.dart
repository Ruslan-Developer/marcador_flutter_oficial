import 'package:flutter/material.dart';

class PaginaAjustes extends StatefulWidget {
  
  Map<String,Object> configuracion;
  

  PaginaAjustes({super.key, required this.configuracion});

  @override
  State<PaginaAjustes> createState() => _PaginaAjustesState();
}

class _PaginaAjustesState extends State<PaginaAjustes> {
  late bool partido5Sets=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //recogemos los datos y los convertimos para poder utilizarlos
    //con los controles asignados
    if(widget.configuracion["Sets"]==5)
    {
        partido5Sets=true;
    }
    else
    {
      partido5Sets=false;
    }
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextField(
            //rellenamos los datos desde la configuracion
            decoration: InputDecoration(
              hintText: widget.configuracion["Jugador 1"].toString(),
              labelText: "Jugador Local"
            ),
          ),
          TextField(
            //rellenamos los datos desde la configuración
            decoration: InputDecoration(
              labelText:"Jugador Visitante",
               hintText: widget.configuracion["Jugador 2"].toString(),
            ),
          ),
          
          Row(
            children: [
              Text("Partido a 5 Sets"),
              //Cargamos los datos inciales en el switch
              //y los datos de salida los convertimos y guardamos en el 
              //map de configuracion
              Switch(
                value: partido5Sets, 
                onChanged: (valor){
                    setState(() {
                    partido5Sets=valor;
                    if(partido5Sets)
                    {
                      widget.configuracion["Sets"]=5;
                    }
                    else
                    {
                      widget.configuracion["Sets"]=3;
                    }
                  });
                }
                ),
            ],
          ),
          MaterialButton(
            child: Text("Guardar"),
            onPressed: (){
            })
          
        ],
      ),
    );
  }
}
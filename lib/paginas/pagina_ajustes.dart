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
    TextEditingController _textoJugadorVisitante=TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [

          // ############## Recoger los datos de un TextField METODO 1
          // Utilizamos la propiedad onChanged para en cada cambio ir guardando
          TextField(
            //rellenamos los datos desde la configuracion
            decoration: InputDecoration(
              hintText: widget.configuracion["Jugador 1"].toString(),
              labelText: "Jugador Local"
            ),
            //primer método para recoger los datos de un TextField
            onChanged: (value) {
              widget.configuracion["Jugador 1"]=value;
            },
          ),
          // ############## Recoger los datos de un TextField METODO 2
          // Utilizamos un TExtEditingController que contendrá los datos.
          // Posteriormente, en nuestro caso el boton, lo procesaremos y guardaremos
          TextField(
            //rellenamos los datos desde la configuración
            decoration: InputDecoration(
              labelText:"Jugador Visitante",
               hintText: widget.configuracion["Jugador 2"].toString(),
            ),
            controller: _textoJugadorVisitante,
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
          //para el boton podemos utilizar desde widgets ya creados, como ElevatedButton
          //FilledButton, OutlinedButton o TextButons o esta otra alternativa que construye un contendor
          //que en su interior tiene un boton plano
          
          Center(
            child: Container(
              width: 250,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                shape: BoxShape.rectangle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4, -4),
                    blurRadius: 5,
                    spreadRadius: 2
                  ),
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(4, 4),
                    blurRadius: 5,
                    spreadRadius: 1)
                ]
              ),
              child: TextButton(
                child: const Text(
                  "Guardar",
                  
                  style: TextStyle(
                    color: Colors.white,
                  )
                  ),
                onPressed: (){
            
                  // Carga de los datos del segundo TextField, a traves de su controlador.
                  widget.configuracion["Jugador 2"]=_textoJugadorVisitante.text;
            
                  // ################ llamada para devolver los datos al widget padre
                  Navigator.pop(context,widget.configuracion);
                }),
            ),
          )
          
        ],
      ),
    );
  }
}
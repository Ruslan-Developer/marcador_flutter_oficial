import 'package:flutter/material.dart';
import 'package:marcador_flutter/paginas/pagina_principal.dart';

class PantallaDeCarga extends StatefulWidget {
  Map<String,Object> configuracion;
  PantallaDeCarga({super.key,required this.configuracion});

  @override
  State<PantallaDeCarga> createState() => _PantallaDeCargaState();
}

class _PantallaDeCargaState extends State<PantallaDeCarga> {
  final _controladorPagina=PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controladorPagina,
        children: const [
          PaginaDeCarga(
            titulo: "Marcador",
            subtitulo: "tenis & padel",
            imagen: "assets/foto1.png",
          ),
          PaginaDeCarga(
            titulo: "Marcador",
            subtitulo: "tenis & padel",
            imagen: "assets/foto2.png",
          ),
          PaginaDeCarga(
            titulo: "Marcador",
            subtitulo: "tenis & padel",
            imagen: "assets/foto3.png",
          )
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30),
            child: FloatingActionButton(
              heroTag: "Prev",
              onPressed: (){
                _controladorPagina.previousPage(
                  duration: const Duration(milliseconds: 300), 
                  curve: Curves.easeIn,
                );
              },
              child: const Icon(Icons.arrow_back),),
          ),
            FloatingActionButton(
              heroTag: "Next",
            onPressed: (){
              if(_controladorPagina.page==2)
              {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> PaginaPrincipal(configuracion: widget.configuracion)));
              }
              else
              {
                _controladorPagina.nextPage(
                duration: const Duration(milliseconds: 300), 
                curve: Curves.easeIn,
              );}
            },
            child: const Icon(Icons.arrow_forward,)
            ),
        ]
        ),
    );
  }
}

class PaginaDeCarga extends StatelessWidget {
  const PaginaDeCarga({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.imagen,
    });
  
  final String titulo;
  final String subtitulo;
  final String imagen;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagen),
          fit: BoxFit.cover,
          ),
      ),
      child: Center(
        child: Container(
          height: 80,
          width: 160,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.4),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 4,
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                titulo,
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                subtitulo,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ]
            ),
        ),
      ),
    );
  }
}
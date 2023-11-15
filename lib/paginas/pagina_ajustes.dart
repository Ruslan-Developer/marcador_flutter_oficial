import 'package:flutter/material.dart';

class PaginaAjustes extends StatelessWidget {
  const PaginaAjustes({super.key});

  @override
  Widget build(BuildContext context) {
    String Jugador1="Jugador1", Jugador2="Jugador 2";
    bool partido5Sets=false;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextField(
            
            decoration: InputDecoration(
              label: Text("Jugador 1"),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text("Jugador 2"),
            ),
          ),
          Switch(value: partido5Sets, onChanged: (valor){}),

        ],
      ),
    );
  }
}
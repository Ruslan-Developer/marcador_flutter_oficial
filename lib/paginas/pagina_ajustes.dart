import 'package:flutter/material.dart';

class PaginaAjustes extends StatelessWidget {
  const PaginaAjustes({super.key});

  @override
  Widget build(BuildContext context) {
    String _jugador1="Jugador1", _jugador2="Jugador 2";
    bool partido5Sets=false;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          TextField(
            
            decoration: InputDecoration(
              label: Text(_jugador1),
            ),
          ),
          TextField(
            decoration: InputDecoration(
              label: Text(_jugador2),
            ),
          ),
          Switch(value: partido5Sets, onChanged: (valor){}),

        ],
      ),
    );
  }
}
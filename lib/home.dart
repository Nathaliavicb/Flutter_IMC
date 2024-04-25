import 'package:flutter/material.dart';
import 'package:app3/imc.dart';
import 'package:app3/resultado.dart';

class HomeIMC extends StatelessWidget{
  @override
  _HomeIMCState createState() => _HomeIMCState;

}

class _HomeIMCState extends State<HomeIMC>{
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  //Limpa os campos da tela

  void _limparCampos(){
    _alturaController.text() = "";
    _pesoController.text() = "";
  }

  void _btnCalcularIMC(){

    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);
    
    var myIMC = IMC(altura: alt, peso:pes);

    //Navegar para a outra tela.

    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IMCResultado(
            imc: myIMC,
          ))),
      
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: _limparCampos)],
        ),

      body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //logotipo
                Padding(
                  padding: EdgeInsets.only(top:30, bottom: 10),
                  child: icon(
                    Icons.calculate_outlined,
                    colos: Colors.purple,
                    size:80.0,
                  )),
                
                   

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Altura'),
                  ),
                ),
                   

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Peso'),
                  ),
                ),

                ElevatedButton(
                  onPressed: _btnCalcularIMC,
                  child: text('Calcular IMC'),
                ), 
                
              ],
            ),
          ),
        )),
  }
}
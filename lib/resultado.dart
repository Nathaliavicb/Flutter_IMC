import 'package:flutter/material.dart';
import 'package:app3/imc.dart';
import 'package:app3/resultado.dart';

class IMCResultado extends StatefulBuilder{
  final IMC imc;
  IMCResultado({this.imc});

  @override 
  _IMCResultadoState createState() => _IMCResultadoState(imc: this.imc);
}

class _IMCResultadoState extends State<IMCResultado>{
  final IMC _imc;
  Color _corFaixa;

  _IMCResultadoState({
    @required IMC imc,
  }) : _imc = imc{
    switch (imc.faixa){
      case FaixaIMC.AbaixoIdeal;
        _corFaixa = Colors.green;
        break;
      case FaixaIMC.PesoIdeal;
        _corFaixa = Colors.blue;
        break;
      case FaixaIMC.AcimaIdeal;
        _corFaixa = Colors.orange;
        break;
      case FaixaIMC.Obesidade1;
        _corFaixa = Colors.orangeAccent;
        break;
      case FaixaIMC.Obesidade2;
        _corFaixa = Colors.red;
        break;
      case FaixaIMC.Obesidade3;
        _corFaixa = Colors.deepPurple;
        break;

    }
  }


  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar( 
        title: Text('Resultado do IMC'),
        backgroundColor: _corFaixa,
      ),
    
    
      body: SingleChildScrollView(
        child: 
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height*0.8,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: _corFaixa, width: 9),
                  borderRadius: BorderRadius.all(Radius.circular((10))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 

              
                  Padding(   
                    padding: EdgeInsets.all(0),
                    child: Text(_imc.imc.toStringPrecision(3),
                      style: GoogleFonts.caladea(fontSize: 90))),

                  Padding( 
                    padding: EdgeInsets.all(10),
                    child: Text(
                      style: TextStyle(fontSize: 16, color: _corFaixa)),
                  
                  Padding( 
                    padding: EdgeInsets.all(0),
                    child: Text(
                      
                    ),
                  )
                    ,)
                ],
              ),) ,),
      )
    
    )
  }

}
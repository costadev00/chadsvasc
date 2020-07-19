import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:async';
// import 'package:flutter/scheduler.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pressionouRadio;
  int pressionouSexo;
  @override
  void initState() {
    super.initState();
    pressionouRadio = 0;
    pressionouSexo = 0;
  }

  double _porcentagem;
  int contador = 0;
  int contador1 = 0;
  int contador2 = 0;
  int contador3 = 0;
  int contador4 = 0;
  int contador5 = 0;
  int contador6 = 0;
  int contador7 = 0;

  bool clicked = false;
  bool clicked2 = false;
  bool clicked3 = false;
  bool clicked4 = false;
  bool clicked5 = false;
  bool mulher = false;
  bool homem = false;
  bool resetou = false;
  bool fodeu = false;
  bool cliquei = false;

  String infoText1 = "";
  String infoText2 = "";
  String infoText3 = "";
  String infoText4 = "";
  String _sexo = "";
  setpressionarRadio(int val) {
    setState(() {
      contador6 = 0;
      pressionouRadio = val;
    });
  }

  setpressionarSexo(int sexo) {
    setState(() {
      contador7 = 0;
      pressionouSexo = sexo;
    });
  }

  _resetar() {
    setState(() {
      pressionouSexo = 0;
      pressionouRadio = 0;
      infoText1 = "";
      infoText2 = "";
      infoText3 = "";
      clicked = false;
      clicked2 = false;
      clicked3 = false;
      clicked4 = false;
      clicked5 = false;
      contador = 0;
      contador1 = 0;
      contador2 = 0;
      contador3 = 0;
      contador4 = 0;
      contador5 = 0;
      contador6 = 0;
      contador7 = 0;
      cliquei = false;
    });
  }

  calcular() {
    setState(() {
      porcentagemCalculo();
      if (mulher && contador == 1) {
        infoText1 = "$_sexo com escore CHA2DS2-VASc de $contador ponto.";
        infoText2 = "A anticoagulação não é necessária";
        infoText3 = "Apresenta um risco de AVC por ano baixo";
        infoText4 = "RISCO BAIXO";
      } else if (mulher && contador == 2) {
        infoText1 = "$_sexo com escore CHA2DS2-VASc de $contador pontos.";
        infoText2 = "A anticoagulação pode ser considerada";
        infoText3 = "Risco de AVC por ano de $_porcentagem%.";
        infoText4 = "RISCO MODERADO";
      } else if (mulher && contador >= 3) {
        infoText1 = "$_sexo com escore CHA2DS2-VASc de $contador pontos.";
        infoText2 =
            "A anticoagulação é recomendada, exceto se contraindicação (HAS-BLED)";
        infoText3 = "Risco de AVC por ano de $_porcentagem%.";
        infoText4 = "RISCO ELEVADO";
      } else if (homem && contador == 0) {
        infoText1 = "$_sexo com escore CHA2DS2-VASc de $contador pontos.";
        infoText2 = "A anticoagulação não é necessária";
        infoText3 = "Risco de AVC por ano de $_porcentagem%.";
        infoText4 = "RISCO BAIXO";
      } else if (homem && contador == 1) {
        infoText1 = "$_sexo com escore CHA2DS2-VASc de $contador pontos.";
        infoText2 = "A anticoagulação pode ser considerada";
        infoText3 = "Risco de AVC por ano de $_porcentagem%.";
        infoText4 = "RISCO MODERADO";
      } else if (homem && contador >= 2) {
        infoText1 = "$_sexo com escore CHA2DS2-VASc de $contador pontos.";
        infoText2 =
            "A anticoagulação é recomendada, exceto se contraindicação (HAS-BLED)";
        infoText3 = "Risco de AVC por ano de $_porcentagem%.";
        infoText4 = "RISCO ELEVADO";
      }
    });
  }

  porcentagemCalculo() {
    setState(() {
      switch (contador) {
        case 0:
          _porcentagem = 0.0;
          break;
        case 1:
          _porcentagem = 1.3;
          break;
        case 2:
          _porcentagem = 2.2;
          break;
        case 3:
          _porcentagem = 3.2;
          break;
        case 4:
          _porcentagem = 4.0;
          break;
        case 5:
          _porcentagem = 6.7;
          break;
        case 6:
          _porcentagem = 9.8;
          break;
        case 7:
          _porcentagem = 9.6;
          break;
        case 8:
          _porcentagem = 6.7;
          break;
        case 9:
          _porcentagem = 15.2;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("CHADS-VASc"),
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                  Colors.red[400],
                  Colors.red[700],
                  Colors.red[900]
                ])),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  _resetar();
                  // fodeu = true;
                  //  _resetar2(){
                  //       check = false;
                  //     }
                })
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(padding: EdgeInsets.only(top: 25.0)),
              CheckboxListTile(
                title: Text('Insuficiência cardíaca ou FEVE inferior a 40%'),
                value: clicked,
                onChanged: (check) {
                  setState(() {
                    if (check) {
                      contador1++;
                    }
                    if (!check) {
                      contador1 = 0;
                    }
                    clicked = check;
                    // print(contador);
                  });
                },
                secondary: CircleAvatar(
                  child: Icon(
                    clicked ? Icons.check : Icons.exposure_plus_1,
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text('Hipertensão arterial'),
                value: clicked2,
                onChanged: (check) {
                  setState(() {
                    if (check) {
                      contador2++;
                    }
                    if (!check) {
                      contador2 = 0;
                    }
                    clicked2 = check;
                    // print(contador);
                  });
                },
                secondary: CircleAvatar(
                  child: Icon(
                    clicked2 ? Icons.check : Icons.exposure_plus_1,
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text('Diabetes mellitus'),
                value: clicked3,
                onChanged: (check) {
                  setState(() {
                    if (check) {
                      contador3++;
                    }
                    if (!check) {
                      contador3 = 0;
                    }
                    clicked3 = check;
                    // print(contador);
                  });
                },
                secondary: CircleAvatar(
                  child: Icon(
                    clicked3 ? Icons.check : Icons.exposure_plus_1,
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text(
                    'Acidente vascular cerebral prévio, embolia periférica ou AIT'),
                value: clicked4,
                onChanged: (check) {
                  // if (fodeu) {
                  //   setState(() {
                  //     print(check);
                  //     check = false;
                  //   });
                  // }
                  // _resetar2(){
                  //   check = false;
                  // }
                  setState(() {
                    if (check) {
                      contador4++;
                      contador4++;
                    }
                    if (!check) {
                      contador4 = 0;
                    }
                    clicked4 = check;
                    // print(contador);
                  });
                },
                secondary: CircleAvatar(
                  child: Icon(
                    clicked4 ? Icons.check : Icons.exposure_plus_2,
                  ),
                ),
              ),
              CheckboxListTile(
                title: Text(
                    'IAM prévio, doença arterial periférica ou placa aórtica'),
                value: clicked5,
                onChanged: (check) {
                  setState(() {
                    if (check) {
                      contador5++;
                    }
                    if (!check) {
                      contador5 = 0;
                    }
                    clicked5 = check;
                    // print(contador);
                  });
                },
                secondary: CircleAvatar(
                  child: Icon(
                    clicked5 ? Icons.check : Icons.exposure_plus_1,
                  ),
                ),
              ),
              Divider(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                      child: Text("Idade", style: TextStyle(fontSize: 20.0))),
                  Row(
                    children: <Widget>[
                      Text("Menor que 65 anos de idade"),
                      Radio(
                        value: 2,
                        groupValue: pressionouRadio,
                        activeColor: Colors.lightGreenAccent[700],
                        onChanged: (val) {
                          print("Radio $val");
                          setpressionarRadio(val);
                          // if (val == 1) {
                          //   contador6 = 0;
                          // }
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Entre 65 a 74 anos de idade "),
                      Radio(
                        value: 1,
                        groupValue: pressionouRadio,
                        activeColor: Colors.orange[700],
                        onChanged: (val) {
                          print("Radio $val");
                          setpressionarRadio(val);
                          contador6++;
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("Maior que 75 anos de idade "),
                      Radio(
                        value: 3,
                        groupValue: pressionouRadio,
                        activeColor: Colors.red[400],
                        onChanged: (val) {
                          print("Radio $val");
                          setpressionarRadio(val);
                          // if (val == 1) {
                          //   contador6 = 0;
                          // }
                          contador6++;
                          contador6++;
                        },
                      ),
                    ],
                  ),
                ],
              ),
              Divider(),
              Column(
                children: <Widget>[
                  Center(child: Text("Sexo", style: TextStyle(fontSize: 20.0))),
                  Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 75.0),
                      ),
                      Text("Feminino"),
                      Radio(
                        value: 1,
                        groupValue: pressionouSexo,
                        activeColor: Colors.pink,
                        onChanged: (sexo) {
                          _sexo = "Mulher";
                          print("Radio $sexo");
                          setpressionarSexo(sexo);
                          contador7++;
                          mulher = true;
                        },
                      ),
                      Radio(
                        value: 2,
                        groupValue: pressionouSexo,
                        activeColor: Colors.blue,
                        onChanged: (sexo) {
                          _sexo = "Homem";
                          print("Radio $sexo");
                          setpressionarSexo(sexo);
                          homem = true;
                        },
                      ),
                      Text("Masculino"),
                      // Container(
                      //   padding: EdgeInsets.all(25.0),
                      // ),
                    ],
                  ),
                ],
              ),
              // Divider(),
              Container(
                padding: EdgeInsets.only(top: 20),
              ),
              SizedBox(
                  child: pressionouSexo != 0
                      ? Center(
                          child: RaisedButton(
                          onPressed: () {
                            cliquei = true;
                            contador = contador1 +
                                contador2 +
                                contador3 +
                                contador4 +
                                contador5 +
                                contador6 +
                                contador7;
                            print(contador);
                            calcular();
                          },
                          textColor: Colors.white,
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Colors.red[900],
                                  Colors.red[700],
                                  Colors.red[400],
                                ],
                              ),
                            ),
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Calcular',
                                style: TextStyle(fontSize: 20)),
                          ),
                        ))
                      : buildRaisedDisabled()),

              (homem && contador == 0) || (mulher && contador == 1) && cliquei
                  ? Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 15.0),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.green[400],
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              infoText1,
                              style: TextStyle(fontSize: 25.0),
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(color: Colors.green[400]),
                            child: Center(
                              child: Text(
                                infoText2,
                                style: TextStyle(fontSize: 20.0),
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.green[400],
                            ),
                            child: Center(
                              child: Text(
                                infoText3,
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                                // textAlign: TextAlign.center,
                              ),
                            )),
                        Container(
                            padding: EdgeInsets.only(top: 5.0),
                            decoration: BoxDecoration(
                                color: Colors.green[400],
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                            child: Center(
                              child: Text(
                                infoText4,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                                // textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    )
                  : cliquei ? buildOrangeResult() : buildRedResult(),
              Divider(),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                    " MAGALHÃES, L. P. et al. II Diretrizes brasileiras de fibrilação atrial. Arquivos Brasileiros de Cardiologia, v. 106, n. 4, p. 1-22, 2016."),
              ),
            ],
          ),
        ));
  }

  Widget buildRaisedDisabled() {
    return Center(
        child: RaisedButton(
      onPressed: null,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.red[900],
              Colors.red[700],
              Colors.red[400],
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child: Text('Calcular', style: TextStyle(fontSize: 20)),
      ),
    ));
  }

  Widget buildOrangeResult() {
    return (homem && contador == 1) || (mulher && contador == 2) && cliquei
        ? Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    infoText1,
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Center(
                    child: Text(
                      infoText2,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Center(
                  child: Text(
                    infoText3,
                    style: TextStyle(
                      fontSize: 15.0,
                    ),
                    // textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      infoText4,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                      // textAlign: TextAlign.center,
                    ),
                  )),
            ],
          )
        : Container();
  }

  Widget buildRedResult() {
    return (homem && contador >= 2) || (mulher && contador >= 3) && cliquei
        ? Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 15.0),
              ),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Text(
                    infoText1,
                    style: TextStyle(fontSize: 25.0),
                  ),
                ),
              ),
              Container(  
                  padding: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(color: Colors.red),
                  child: Center(
                    child: Text(
                      infoText2,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(top: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Center(
                    child: Text(
                      infoText3,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  )),
              Container(
                  padding: EdgeInsets.only(
                    top: 5.0,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20))),
                  child: Center(
                    child: Text(
                      infoText4,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                      // textAlign: TextAlign.center,
                    ),
                  )),
            ],
          )
        : Container();
  }
}

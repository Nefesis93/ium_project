import 'package:flutter/material.dart';
import 'package:ium_project/pages/add_recensione/add_recensione_dialog.dart';
import 'package:ium_project/utility/bars/bars.dart';

class AddRecensione extends StatelessWidget {
  const AddRecensione({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: const CloseAppBar(
          title: "Inserisci Recensione",
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //scritta in alto
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Text(
                        "Scrivi una recensione",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    //text box
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.blue,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: TextField(
                            maxLines: 10,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    //lista dei numeri
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 20, 20, 0),
                          child: Container(
                            width: 200,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                Text(
                                  '1',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '2',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '3',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '4',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '5',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),  
                          ),
                        ),
                      ],
                    ),
                    //riga chiarezza
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.blue,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  'Chiarezza',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                                
                            ],
                          ),
                          const VotoRecensione(),
                        ],
                      ),
                    ),
                    //riga validitá
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.red,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  'Validitá',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VotoRecensione(),
                        ],
                      ),
                    ),
                    //riga correttezza
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.green,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Text(
                                  'Correttezza',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const VotoRecensione(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 50, 10, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Annulla",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.blue,
                                )
                              )
                            )
                          ),
                          Container(
                            height: 40,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: TextButton(
                              onPressed: () {
                                AddRecensioneDialog.recensioneInseritaDialog(context);
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Inserisci Recensione",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                )
                              )
                            )
                          ),
                        ],
                      )
                    ), 
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class VotoRecensione extends StatefulWidget {
  const VotoRecensione({Key? key}) : super(key: key);

  @override
  State<VotoRecensione> createState() => VotoState();
}

class VotoState extends State<VotoRecensione> {
  int? _voto = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[ 
        Radio(
          value: 1,
          groupValue: _voto,
          onChanged: (int? k) {
            setState(() {
              _voto = k;
            });
          },
        ),
        Radio(
          value: 2,
          groupValue: _voto,
          onChanged: (int? k) {
            setState(() {
              _voto = k;
            });
          },
        ),
        Radio(
          value: 3,
          groupValue: _voto,
          onChanged: (int? k) {
            setState(() {
              _voto = k;
            });
          },
        ),
        Radio(
          value: 4,
          groupValue: _voto,
          onChanged: (int? k) {
            setState(() {
              _voto = k;
            });
          },
        ),
        Radio(
          value: 5,
          groupValue: _voto,
          onChanged: (int? k) {
            setState(() {
              _voto = k;
            });
          },
        ),
      ],
    );
  }
}
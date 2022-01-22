import 'package:flutter/material.dart';

class AddRecensione extends StatelessWidget {
  const AddRecensione({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Inserisci Recensione",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
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
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "Scrivi una recensione",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    //text box
                    Container(
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
                        ),
                      ),
                    ),
                    //lista dei numeri
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
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
                    //riga chiarezza
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Row(
                        children: const <Widget>[
                          Icon(
                            Icons.star,
                            color: Colors.blue,
                          ),
                          Text(
                            'Chiarezza',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 15,
                            ),
                          ),
                          VotoChiarezza(),
                        ],
                      ),
                    )
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


class VotoChiarezza extends StatefulWidget {
  const VotoChiarezza({Key? key}) : super(key: key);

  @override
  State<VotoChiarezza> createState() => ChiarezaState();
}

class ChiarezaState extends State<VotoChiarezza> {
  int? _voto = 0;

   @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[ 
        RadioListTile<int>(
          title: const Text('a'),
          value: 1,
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
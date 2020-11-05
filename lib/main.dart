import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Mesin Luas Persegi"),
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
        ),
        body: FormInput(),
      ),
    );
  }
}

class FormInput extends StatefulWidget {
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  TextEditingController etPanjang = new TextEditingController();
  TextEditingController etLebar = new TextEditingController();

  double nPanjang = 0.0;
  double nLebar = 0.0;
  double nCount = 0.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lebar'.toUpperCase(),
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: etLebar,
            decoration: const InputDecoration(
              hintText: "Enter Your Number",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a number';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Panjang'.toUpperCase(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: etPanjang,
            decoration: const InputDecoration(
              hintText: "Enter Your Number",
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter a number';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Text('Hitung'),
              ),
              onPressed: () {
                setState(() {
                  nLebar = double.parse(etLebar.text);
                  nPanjang = double.parse(etPanjang.text);
                  nCount = nLebar * nPanjang;
                });
              },
            ),
          ),
          Row(
            children: [
              Text(
                "Hasil : ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                nCount.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}

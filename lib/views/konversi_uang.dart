import 'package:flutter/material.dart';

class conversiMoney extends StatefulWidget {
  const conversiMoney({Key? key}) : super(key: key);

  @override
  _conversiMoneyState createState() => _conversiMoneyState();
}

// currency IDR, USD, EUR, JPY
class _conversiMoneyState extends State<conversiMoney> {
  late double datainput;
  late double dataoutput;
  late String Inputmatauang;
  late String Outputmatauang;
  late String resultdata;

  final TextEditingController datainputController = TextEditingController();

  @override
  void initState() {
    super.initState();
    datainput = 0;
    Inputmatauang = 'IDR';
    Outputmatauang = 'IDR';
    resultdata = '';
  }

  void _onInputChanged(String value) {
    setState(() {
      datainput = double.tryParse(value) ?? 0;
    });
  }

  void _onCurrencyInputChanged(String? value) {
    setState(() {
      Inputmatauang = value ?? 'IDR';
    });
  }

  void _onCurrencyOutputChanged(String? value) {
    setState(() {
      Outputmatauang = value ?? 'IDR';
    });
  }

  void _convert() {
    setState(() {
      switch (Inputmatauang) {
        case 'IDR':
          switch (Outputmatauang) {
            case 'IDR':
              dataoutput = datainput;
              break;
            case 'USD':
              dataoutput = datainput / 14200;
              break;
            case 'EUR':
              dataoutput = datainput / 17000;
              break;
            case 'JPY':
              dataoutput = datainput / 130;
              break;
          }
          break;
        case 'USD':
          switch (Outputmatauang) {
            case 'IDR':
              dataoutput = datainput * 14200;
              break;
            case 'USD':
              dataoutput = datainput;
              break;
            case 'EUR':
              dataoutput = datainput * 0.85;
              break;
            case 'JPY':
              dataoutput = datainput * 110;
              break;
          }
          break;
        case 'EUR':
          switch (Outputmatauang) {
            case 'IDR':
              dataoutput = datainput * 17000;
              break;
            case 'USD':
              dataoutput = datainput * 1.17;
              break;
            case 'EUR':
              dataoutput = datainput;
              break;
            case 'JPY':
              dataoutput = datainput * 130;
              break;
          }
          break;
        case 'JPY':
          switch (Outputmatauang) {
            case 'IDR':
              dataoutput = datainput * 130;
              break;
            case 'USD':
              dataoutput = datainput * 0.0091;
              break;
            case 'EUR':
              dataoutput = datainput * 0.0077;
              break;
            case 'JPY':
              dataoutput = datainput;
              break;
          }
          break;
      }
      resultdata = dataoutput.toStringAsFixed(2);
    });
  }

  @override
  // make dropdown button without array looping

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Conversion'),
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: _onInputChanged,
              controller: datainputController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                labelText: 'Input',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: Inputmatauang,
              onChanged: _onCurrencyInputChanged,
              items: const <String>['IDR', 'USD', 'EUR', 'JPY']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 20)),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton<String>(
              value: Outputmatauang,
              onChanged: _onCurrencyOutputChanged,
              items: const <String>['IDR', 'USD', 'EUR', 'JPY']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 20)),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding:
                const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                primary: Colors.blueAccent,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: _convert,
              child: const Text('Convert'),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              resultdata,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
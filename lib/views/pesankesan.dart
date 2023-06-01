import 'package:projekan/views/loginpage.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  late final ElevatedButton _logOutButton;

  @override
  void initState() {
    super.initState();

    _logOutButton = ElevatedButton(
      onPressed: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => loginpage()),
              (route) => false,
        );
      },

      child: const Text('Log Out'),
      style: ElevatedButton.styleFrom(
        primary: Colors.redAccent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pesan Kesan TPM'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Pesan dan Kesan TPM ',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Pesan',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Untuk responsinya nanti jangan terlalu susah yang mudah-mudah aja lah ya',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Kesan',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Kuliahnya praktikum TPM ini menyenangkan dan santai',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Terima Kasih aslab udah mengajar 1 semester ini semoga kita tidak hanya sebatas ini aja silaturahimnya berlanjut sampai kapanpun dan dimanapun',
              style: TextStyle(fontSize: 16.0),
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Salam Manis Selvi Dan Dodi',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
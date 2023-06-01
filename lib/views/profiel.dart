import 'package:flutter/material.dart';
import 'package:projekan/views/pesankesan.dart';
import 'LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'detailprofiel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Map<String, dynamic>> profiles = [
    {
      'name': 'Selvi',
      'nim': '123200026',
      'image': 'images/selvi.jpeg',
      'detail': 'Halo! Perkenalkan saya Selvi dengan Nim 123200026. Saya memiliki hoby Berenang, Jalan-jalan dan Jogging '
          'dan juga memiliki cita cita sebagai FrontEnd Develeoper. Saya lahir di Banyuasin pada tanggal 19 Maret 2003.'
    },
    {
      'name': 'Dodi Alfarisi',
      'nim': '123200011',
      'image': 'images/dodi.jpg',
      'detail' : 'Halo! Perkenalkan saya Dodi alfarisi dengan Nim 123200011. Saya memiliki hoby Main Game'
          'dan juga memiliki cita citanya pengen cepat Lulus. Saya lahir di Medan pada tanggal 29 Mei 2002.'
    },
  ];

  int selectedProfileIndex = 0;

  void _logout() async {
    // Simpan status login ke false atau hapus data user yang sedang login
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);

    // Navigasi ke halaman login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => loginpage ()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        backgroundColor: Colors.blue[900],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage(profiles[selectedProfileIndex]['image']),
              ),
              SizedBox(height: 16),
              Text(
                "Nama : ${profiles[selectedProfileIndex]['name']}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              Text(
                "NIM : ${profiles[selectedProfileIndex]['nim']}",
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailProfilePage(
                        profile: profiles[selectedProfileIndex],
                      ),
                    ),
                  );
                },
                child: Text(
                  "Lihat Detail",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[900],
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _logout,
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  elevation: 4,
                ),
              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (index) => HelpPage()),
                  );
                },
                child: Text('Pesan & Kesan'),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(Size(100, 35)),
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.blueAccent),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                ),
              ),


              SizedBox(height: 16),
              Text(
                "Pilih Profil:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[900],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  profiles.length,
                      (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedProfileIndex = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      padding:
                      EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: selectedProfileIndex == index
                            ? Colors.blue[900]
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        "${index + 1}",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: selectedProfileIndex == index
                              ? Colors.white
                              : Colors.blue[900],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
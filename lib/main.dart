import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/Menu_Proveder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MenuProvider()),
      ],
      child: MaterialApp(
        title: 'Cek Makanan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: TextTheme(
            bodyMedium: TextStyle(color: Colors.black87), // Changed to bodyMedium
          ),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();
  String _selectedMeal = 'Sarapan Pagi'; // Set the initial value to match one of the dropdown items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cek Makanan', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset(
                'assets/makanan.png', // Ganti dengan path gambar Anda
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              'Pilih Jenis Makanan',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blueAccent),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedMeal,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              ),
              items: <String>['Sarapan Pagi', 'Makan Siang', 'Makan Malam']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedMeal = newValue!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final String name = _selectedMeal;

                if (name.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Peringatan'),
                        content: Text('Harap pilih jenis makanan.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  context.read<MenuProvider>().generateMakanan(name);

                  // Show dialog with the result
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Hasil Cek Makanan'),
                        content: Consumer<MenuProvider>(
                          builder: (context, provider, child) {
                            if (provider.makanans.isEmpty) {
                              return Text('Belum ada hasil.');
                            } else {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Jenis: $name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Menu Kamu: ${provider.makanans.first.name}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              );
                            }
                          },
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Cek Makanan', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

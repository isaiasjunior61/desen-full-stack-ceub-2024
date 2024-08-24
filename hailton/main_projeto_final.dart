<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:app_novo/models/home.dart';
import 'package:app_novo/models/color_selection.dart';
import 'util.dart';
import 'theme.dart';
=======


import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'detalhe_receita_page.dart';
import 'model/receita_model.dart';
>>>>>>> 080e12ba7c3f7a4c533c1dbef86ad15229e0e3c0

void main() {
  runApp(const MyApp());
}

<<<<<<< HEAD
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode themeMode = ThemeMode.light;
  ColorSelection colorSelection = ColorSelection.indigo;

  void toggleThemeMode() {
    setState(() {
      themeMode = themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }


  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Nunito Sans", "Nunito Sans");

    MaterialTheme theme = MaterialTheme(textTheme);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      darkTheme: theme.dark(),
      theme: theme.light(),
      home: Home(
        changeTheme: (useLightMode) {
          toggleThemeMode();

        },
        changeColor: (value) {},
        title: "Teste",
        colorSelection: ColorSelection.indigo,
      ),
    );
  }
=======
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ReceitaHome();
  }
}

class ReceitaHome extends StatefulWidget {
  const ReceitaHome({super.key});

  @override
  State<ReceitaHome> createState() => _ReceitaHomeState();
}

class _ReceitaHomeState extends State<ReceitaHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Receita Home",
      theme: ThemeData().copyWith(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Receitas"),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: ReceitaModel.listaReceita.length,
                itemBuilder: (context, index) {
                  var receita = ReceitaModel.listaReceita[index];
                  return CardReceitaWidget(receita: receita);
                },
              ),
            )),
      ),
    );
  }
}

class CardReceitaWidget extends StatelessWidget {
  final ReceitaModel receita;
  const CardReceitaWidget({super.key, required this.receita});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return DetalheReceitaPage(
              receitaModel: receita,
            );
          },
        ));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Column(
            children: [
              Container(
                width: double.maxFinite,
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                  child: Image.asset(
                    receita.assetImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  receita.nome,
                  style:
                  Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.redAccent),
                  // style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 24),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ReceitaApp extends StatelessWidget {
  const ReceitaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.lightGreen,
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Clique para aumentar',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
>>>>>>> 080e12ba7c3f7a4c533c1dbef86ad15229e0e3c0
}
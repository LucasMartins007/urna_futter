import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:urna_eletrnonica/model/enum/EnumCategorias.dart';
import 'package:urna_eletrnonica/widget/ListCandidatosWidget.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 2,
      navigateAfterSeconds: new ListCandidatosWidget(
        categoria: EnumCategorias.ALL,
      ),
      photoSize: 80,
      gradientBackground: LinearGradient(
        tileMode: TileMode.mirror,
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.white,
          Colors.deepPurple[100]!,
          // Colors.deepPurple[200]!,
        ],
      ),
      loadingText: Text(
        "Aguarde",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
      ),
      title: Text(
        "Urna eletrônica",
        textAlign: TextAlign.justify,
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
      ),
      image: Image.asset(
        "images/logo.png",
        color: Colors.deepPurple,
      ),
      loaderColor: Colors.black,
      useLoader: true,
    );
  }
}

class AfterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Welcome In SplashScreen Package"),
        automaticallyImplyLeading: false,
      ),
      body: new Center(
        child: new Text(
          "Succeeded!",
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }
}

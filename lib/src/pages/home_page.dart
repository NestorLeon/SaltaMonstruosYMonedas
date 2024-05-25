import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
//import 'package:just_audio/just_audio.dart';
import 'package:salta_monstruos_y_monedas/src/classes/hongo.dart';
import 'package:salta_monstruos_y_monedas/src/classes/meta.dart';
import 'package:salta_monstruos_y_monedas/src/classes/moneda.dart';
import 'package:salta_monstruos_y_monedas/src/classes/personita.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late AudioPlayer player;

  static double personitaYAxis = 1;
  double personitaXAxis = 0;
  static double personitaSize = 1.2;
  double personitaAncho = 45 * personitaSize;
  double personitaAlto = 100 * personitaSize;

  static double hongoXAxis = 1.2;
  double hongoYAxis = 1;
  double velocidadXHongo = 0.005;
  static double hongoSize = 1.0;
  double hongoAncho = 36 * hongoSize;
  double hongoAlto = 40 * hongoSize;

  static double monedaXAxis = 1.6;
  double monedaYAxis = 1;
  double velocidadXmoneda = 0.01;
  static double monedaSize = 1.0;
  double monedaAncho = 34 * monedaSize;
  double monedaAlto = 40 * monedaSize;

  static double metaXAxis = 2.0;
  double velocidadXMeta = 0.02;
  bool canPlay = true;
  bool showMeta = false;

  int score = 0;
  int highscore = 0;
  String message = "T A P  T O  P L A Y";
  String message1 = "";

  double time = 0;
  double height = 0;
  double initialHeight = personitaYAxis;
  bool gameHasStarted = false;

  @override
  void initState() {
    super.initState();
    // player = AudioPlayer();
  }

  @override
  void dispose() {
    // available for other apps to use.
    // player.dispose();
    super.dispose();
  }

  void reproduceSonidoMoneda() async {
    // await player.setAsset('lib/src/audios/giant bell.mp3');
    // player.play();
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = personitaYAxis;
    });
  }

  void onTap() {
    if (gameHasStarted) {
      jump();
    } else {
      startGame();
    }
  }

  bool chocaConHongo() {
    bool resultado = false;

    if ((personitaXAxis - hongoXAxis).abs() < 0.075 &&
        (personitaYAxis - hongoYAxis).abs() < 0.1) resultado = true;
    return resultado;

    // double pIzquierda = personitaXAxis - personitaAncho / (2.0 * 1000);
    // double pDerecha = personitaXAxis + personitaAncho / (2.0 * 1000);
    // double pArriba = personitaYAxis - personitaAlto / (2.0 * 1000);
    // double pAbajo = personitaYAxis + personitaAlto / (2.0 * 1000);

    // double hIzquierda = hongoXAxis - hongoAncho / (2.0 * 1000);
    // double hDerecha = hongoXAxis + hongoAncho / (2.0 * 1000);
    // double hArriba = hongoYAxis - hongoAlto / (2.0 * 1000);
    // double hAbajo = hongoYAxis + hongoAlto / (2.0 * 1000);

    // return pDerecha >= hIzquierda &&
    //     pIzquierda <= hDerecha &&
    //     pArriba >= hAbajo &&
    //     pAbajo <= hArriba;
  }

  bool chocaConMoneda() {
    bool resultado = false;

    if ((personitaXAxis - monedaXAxis).abs() < 0.075 &&
        (personitaYAxis - monedaYAxis).abs() < 0.45) resultado = true;
    return resultado;

    // double pIzquierda = personitaXAxis - personitaAncho / 2.0;
    // double pDerecha = personitaXAxis + personitaAncho / 2.0;
    // double pArriba = personitaYAxis - personitaAlto / 2.0;
    // double pAbajo = personitaYAxis + personitaAlto / 2.0;

    // double mIzquierda = monedaXAxis - monedaAncho / 2.0;
    // double mDerecha = monedaXAxis + monedaAncho / 2.0;
    // double mArriba = monedaYAxis - monedaAlto / 2.0;
    // double mAbajo = monedaYAxis + monedaAlto / 2.0;

    // return pDerecha >= mIzquierda &&
    //     pIzquierda <= mDerecha &&
    //     pArriba >= mAbajo &&
    //     pAbajo <= mArriba;
  }

  bool chocaConMeta() {
    bool resultado = false;

    if ((personitaXAxis - metaXAxis).abs() < 0.05) resultado = true;
    return resultado;

    // double pIzquierda = personitaXAxis - personitaAncho / 2.0;
    // double pDerecha = personitaXAxis + personitaAncho / 2.0;
    // double pArriba = personitaYAxis - personitaAlto / 2.0;
    // double pAbajo = personitaYAxis + personitaAlto / 2.0;

    // double mIzquierda = monedaXAxis - monedaAncho / 2.0;
    // double mDerecha = monedaXAxis + monedaAncho / 2.0;
    // double mArriba = monedaYAxis - monedaAlto / 2.0;
    // double mAbajo = monedaYAxis + monedaAlto / 2.0;

    // return pDerecha >= mIzquierda &&
    //     pIzquierda <= mDerecha &&
    //     pArriba >= mAbajo &&
    //     pAbajo <= mArriba;
  }

  void startGame() {
    gameHasStarted = true;
    score = 0;
    hongoXAxis = 1.2;
    monedaXAxis = 1.6;
    velocidadXHongo = 0.005;
    velocidadXmoneda = 0.01;
    canPlay = true;
    showMeta = false;
    metaXAxis = 2.0;
    velocidadXMeta = 0.02;

    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.06;

      // -----------------------------
      //        VERIFICAR SI CHOCA
      //        CON HONGO
      // -----------------------------
      if (chocaConHongo()) {
        timer.cancel();
        // TERMINAR JUEGO
        if (score > highscore) highscore = score;
        gameHasStarted = false;
        message = "T A P  T O  P L A Y";
        message1 = "G A M E  O V E R";
      }

      // -----------------------------
      //        VERIFICAR SI CHOCA
      //        CON MONEDA
      // -----------------------------
      if (chocaConMoneda()) {
        score++;
        reproduceSonidoMoneda();
        if (score == 7) {
          hongoXAxis = 1.4;
          monedaXAxis = 1.6;
          canPlay = false;
          showMeta = true;
          personitaYAxis = 1;
        } else {
          monedaXAxis = 1.5;
          velocidadXmoneda += 0.001;
          Random random = new Random();
          int randomNumber = random.nextInt(180);
          // de -0.8 a 1 ===>  0.8 + 1 = 1.8 ===> 180
          monedaYAxis = randomNumber / 100.0 - 0.8;
        }
      }

      if (canPlay) {
        // -----------------------------
        //        SALTO
        // -----------------------------
        height = -4.9 * time * time + 3.9 * time;
        if (initialHeight - height > 1) {
          setState(() {
            personitaYAxis = 1;
          });
        } else {
          setState(() {
            personitaYAxis = initialHeight - height;
          });
        }

        // -----------------------------
        //        MOVER HONGO
        // -----------------------------
        setState(() {
          hongoXAxis -= velocidadXHongo;
          if (hongoXAxis < -2) {
            hongoXAxis = 1.5;
            velocidadXHongo += 0.003;
          }
        });

        // -----------------------------
        //        MOVER MONEDA
        // -----------------------------
        setState(() {
          monedaXAxis -= velocidadXmoneda;
          if (monedaXAxis < -2) {
            monedaXAxis = 1.5;
            velocidadXmoneda += 0.003;
            Random random = new Random();
            int randomNumber = random.nextInt(180);
            // de -0.8 a 1 ===>  0.8 + 1 = 1.8 ===> 180
            monedaYAxis = randomNumber / 100.0 - 0.8;
          }
        });
      }

      if (showMeta) {
        if (chocaConMeta()) {
          timer.cancel();
          // TERMINAR JUEGO
          if (score > highscore) highscore = score;
          gameHasStarted = false;
          message1 = "FELIZ CUMPLEAÑOS\nXARENI!! 🎂🎁🎉";
          message = "TE AMO MUCHO ❤️\nPAPÁ 🥰😘";
        }

        // -----------------------------
        //        MOVER META
        // -----------------------------
        setState(() {
          metaXAxis -= velocidadXMeta;
          if (metaXAxis < -2) {
            metaXAxis = 1.5;
            velocidadXMeta += 0.003;
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                flex: 2,
                child: Stack(
                  children: [
                    AnimatedContainer(
                        alignment: Alignment(metaXAxis, 1.1),
                        color: Colors.blue,
                        duration: Duration(milliseconds: 0),
                        child: Meta()),
                    AnimatedContainer(
                      alignment: Alignment(personitaXAxis, personitaYAxis),
                      duration: Duration(milliseconds: 0),
                      child: Personita(
                        size: personitaSize,
                      ),
                    ),
                    Container(
                        alignment: Alignment(0, 0),
                        child: gameHasStarted
                            ? Text("")
                            : Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        message1,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        message,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                    AnimatedContainer(
                      alignment: Alignment(hongoXAxis, hongoYAxis),
                      duration: Duration(milliseconds: 0),
                      child: Hongo(
                        size: hongoSize,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment(monedaXAxis, monedaYAxis),
                      duration: Duration(milliseconds: 0),
                      child: Moneda(
                        size: monedaSize,
                      ),
                    ),
                  ],
                )),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("SCORE",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(score.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 35))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("BEST",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        Text(highscore.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 35))
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

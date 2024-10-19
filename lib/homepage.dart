import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/engine.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Engine game = Engine();
  String won = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Color.fromARGB(255, 3, 18, 43),
              Colors.black,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.height / 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.close,
                        size: size.height / 20,
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: size.height / 20),
                  child: Text(
                    won == ""
                        ? "Lets Play"
                        : won == "O won the match"
                            ? "AI won the match"
                            : won,
                    style: GoogleFonts.exo2(
                        color: Colors.white, fontSize: size.height / 35),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height / 20),
                  child: SizedBox(
                    height: size.height / 2.3,
                    child: GridView.builder(
                        itemCount: 3 * 3,
                        padding: EdgeInsets.all(size.height / 40),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          int row = index ~/ 3;
                          int col = index % 3;

                          return GestureDetector(
                            onTap: () {
                              won = game.handleClick(row, col);
                              setState(() {});
                            },
                            child: Padding(
                              padding: EdgeInsets.all(size.height / 100),
                              child: Container(
                                height: size.height / 12,
                                width: size.height / 12,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                child: game.board[row][col] == ''
                                    ? Container()
                                    : game.board[row][col] == "o"
                                        ? Icon(
                                            Icons.circle_outlined,
                                            color: const Color.fromARGB(
                                                255, 232, 130, 83),
                                            size: size.height / 14,
                                            shadows: [
                                              Shadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                blurRadius: 1,
                                                offset: const Offset(2, 5),
                                              ),
                                            ],
                                          )
                                        : Icon(
                                            Icons.close,
                                            color: const Color.fromARGB(
                                                255, 241, 100, 147),
                                            size: size.height / 12,
                                            shadows: [
                                              Shadow(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                blurRadius: 1,
                                                offset: const Offset(2, 5),
                                              ),
                                            ],
                                          ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height / 40, vertical: size.height / 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: size.height / 20,
                          width: size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.orange,
                                    Colors.red,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            "Exit",
                            style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: size.height / 50),
                          )),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          game.playAgain();
                          setState(() {});
                        },
                        child: Container(
                          height: size.height / 20,
                          width: size.width / 3.2,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.orange,
                                    Colors.red,
                                  ]),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.white.withOpacity(0.6),
                                    blurRadius: 10,
                                    spreadRadius: 1)
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                              child: Text(
                            "Play Again",
                            style: GoogleFonts.exo2(
                                color: Colors.white,
                                fontSize: size.height / 50),
                          )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

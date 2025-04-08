import 'dart:math';

import 'package:devinsight/config/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Publicationscard extends ConsumerWidget {
  const Publicationscard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String codeSnippet = """class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
  }
};
class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
  }
};
class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
  }
};
class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
  }
};
class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
  }
};
class Astra {
  public bool CanBypassTejoUlt { get; set; } = true;
  public string GetAdjustment() {
    return "Welcome to new adjustment of Astra.";
  }
};""";

    String previewSnippet =
        '${codeSnippet.split('\n').take(5).join('\n')}\n...';

    List<int> reactions = [2, 45, 32];

    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 1, bottom: 1),
      child: Column(
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              const AlignTransition(
                alignment: AlwaysStoppedAnimation(Alignment.center),
                child: Text(
                  'Publicaciones',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              );
              ref.read(appRouterProvider).go(AppRouter.publications);
            },
            child: Card(
              color: const Color(0xFF1C1A30),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 10, bottom: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: SvgPicture.asset(
                            'assets/icons/rocket.svg',
                            height: 30,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Flutter Code',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                            Text('Hoy a las 2 PM',
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Bienvenidos al nuevo ajuste de Astra...',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 5),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        previewSnippet,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            _buildReaction(Icons.check_circle, reactions[0],
                                Colors.greenAccent),
                            const SizedBox(width: 8),
                            _buildReaction(
                                Icons.favorite, reactions[1], Colors.yellow),
                            const SizedBox(width: 8),
                            _buildReaction(
                                Icons.mood, reactions[2], Colors.blueAccent),
                          ],
                        ),
                        IconButton(
                          icon:
                              const Icon(Icons.fullscreen, color: Colors.white),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  //showdialog de previsualizacion de publicacion
                                  insetPadding: const EdgeInsets.all(16),
                                  backgroundColor: const Color(0xFF1C1A30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Container(
                                    //el contenedor como tal que tiene la publicacion
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: MediaQuery.of(context).size.height *
                                        0.8,
                                    width:
                                        MediaQuery.of(context).size.width * 1.5,
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsets.all(3),
                                          child: Center(
                                            child: Text(
                                              'Previsualización del código',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Expanded(
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1,
                                            decoration: BoxDecoration(
                                              color: const Color.fromARGB(
                                                      255, 73, 73, 73)
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.vertical,
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Text(
                                                    codeSnippet,
                                                    style: const TextStyle(
                                                      fontFamily: 'monospace',
                                                      fontSize: 12,
                                                      color: Colors.greenAccent,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            //botones de cerrar y ver mas
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  ref
                                                      .read(appRouterProvider)
                                                      .go(AppRouter
                                                          .publications);
                                                },
                                                child: Container(
                                                  width: 120,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.blueAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: const Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'Ver más',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                  
                                                  width: 120,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Colors.redAccent,
                                                    borderRadius:
                                                        BorderRadius.circular(10),
                                                  ),
                                                  child: const Align(
                                                    alignment: Alignment.center,
                                                    child:  Text(
                                                      'Cerrar',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReaction(IconData icon, int count, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 18),
        const SizedBox(width: 4),
        Text(
          count.toString(),
          style: TextStyle(color: color, fontSize: 14),
        ),
      ],
    );
  }
}

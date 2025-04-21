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
      padding: const EdgeInsets.only(left: 2, right: 2, top: 1, bottom: 1),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 2, right: 2, bottom: 2),
            child: Card(
              borderOnForeground: true,
              shadowColor: Colors.white,
              color: const Color(0xFF0E0B1F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(
                  color: Color(0xFF1f212a),
                  width: 0.8,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //ESTE ES EL TITULO DE LA PUBLICACION
                    Row(
                      children: [
                        // Contenido expandido a la izquierda
                        Expanded(
                          child: Row(
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
                                  Text(
                                    'Flutter Code',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Hoy a las 2 PM',
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Ícono alineado a la derecha
                        IconButton(
                          icon:
                              const Icon(Icons.more_vert, color: Colors.white),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Opciones',
                                      style: TextStyle(color: Colors.white)),
                                  backgroundColor: const Color(0xFF1C1A30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.edit,
                                            color: Colors.blue),
                                        title: const Text('Editar',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onTap: () {
                                          // Add your edit logic here
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.delete,
                                            color: Colors.red),
                                        title: const Text('Eliminar',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onTap: () {
                                          // Add your delete logic here
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),

                    //ESTE ES EL TITULO DE LA PUBLICACION

                    const SizedBox(height: 10),
                    const Text(
                      'Bienvenidos al nuevo ajuste de Astra...',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    GestureDetector(
                      onTap: () {
                        ref.read(appRouterProvider).go(AppRouter.publications);
                      },
                      child: Container(
                        height: 200, // Altura fija del Container
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(255, 5, 18, 14),
                            width: 1,
                          ),
                          color: const Color(0xFF1f212a).withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 2, left: 2),
                              child: Text(
                                previewSnippet,
                                style: const TextStyle(
                                  fontFamily: 'monospace',
                                  color: Color.fromARGB(255, 3, 214, 108),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),

                            // Agrega Spacer para empujar el contenido al fondo
                            const Spacer(),

                            // Contenedor con Row al fondo
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      //showdialog de previsualizacion de publicacion
                                      insetPadding: const EdgeInsets.all(16),
                                      backgroundColor: const Color(0xFF1C1A30),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Container(
                                        //el contenedor como tal que tiene la publicacion
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.8,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.5,
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
                                                  color: const Color(0xFF1f212a)
                                                      .withOpacity(0.3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  child: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20),
                                                      child: Text(
                                                        codeSnippet,
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'monospace',
                                                          fontSize: 12,
                                                          color: Colors
                                                              .greenAccent,
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
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        ref
                                                            .read(
                                                                appRouterProvider)
                                                            .go(AppRouter
                                                                .publications);
                                                      },
                                                      child: Container(
                                                        width: 120,
                                                        height: 40,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.blueAccent,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: const Align(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'Ver más',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Container(
                                                      width: 120,
                                                      height: 40,
                                                      decoration: BoxDecoration(
                                                        color: Colors.redAccent,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child: const Align(
                                                        alignment:
                                                            Alignment.center,
                                                        child: Text(
                                                          'Cerrar',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
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
                              child: Container(
                                width: double.infinity, // Ocupa todo el ancho
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xFF24292f),
                                    width: 1,
                                  ),
                                  borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  color: const Color(0xFF1f212a),
                                ),
                                child: const Center(
                                  child: Row(
                                    mainAxisSize: MainAxisSize
                                        .min, // Ajusta el Row al contenido
                                    children: [
                                      Text(
                                        "Ver Más",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(width: 6),
                                      Icon(Icons.keyboard_arrow_up_outlined,
                                          color: Colors.white, size: 18),
                                      SizedBox(
                                          width:
                                              6), // Espacio entre el ícono y el texto
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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
                          icon: const Icon(Icons.share, color: Colors.white),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return const AlertDialog(
                                    title: Center(
                                        child: Text(
                                      'Compartir',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 250, 250, 250)),
                                    )),
                                    content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Icon(
                                                Icons.facebook,
                                                color: Colors.blue,
                                                size: 40,
                                              ),
                                              Icon(
                                                Icons.telegram,
                                                color: Colors.blue,
                                                size: 40,
                                              ),
                                              Icon(
                                                Icons.email,
                                                color: Colors.blue,
                                                size: 40,
                                              ),
                                            ],
                                          )
                                        ]),
                                  );
                                });
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

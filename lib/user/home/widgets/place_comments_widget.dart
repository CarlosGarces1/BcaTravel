import 'package:bcatravel/user/home/models/place.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlaceCommentsWidget extends StatelessWidget {
  const PlaceCommentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white.withOpacity(0),
            Colors.white,
          ],
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: GestureDetector(
                  onTap: () {
                    showComments(context);
                  },
                  child: Container(
                    height: 60,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade800,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        for (var i = 0; i < 2; i++)
                          Align(
                            widthFactor: .7,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                    TravelUser.users[i].urlPhoto,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(width: 10),
                        const Text(
                          'Comments',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          '2 ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Icon(Icons.arrow_forward),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade50,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.location_on,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<dynamic> showComments(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext builder) {
        return CupertinoPopupSurface(
          child: Container(
            color: CupertinoColors.white,
            // alignment: Alignment.center,
            width: double.infinity,
            height: 500,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
                child: Column(
                  children: [
                    const Text(
                      'Comentarios',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          decoration: TextDecoration.none),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          CircleAvatar(
                            // backgroundColor: Colors.red,
                            radius: media.height * 0.03,
                            backgroundImage: const NetworkImage(
                              "https://lh3.googleusercontent.com/a-/AFdZucpaioQw3FVX3MKuL26ARCnxTp1LNkbSRPmsNhKjDAo=s288-p-no",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: media.width * 0.6,
                            height: media.height * 0.07,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text(
                                  'Carlos Garcés',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '"Este Restaurante tiene una buena atención y un buen servicio"',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 10,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 20),
                          CircleAvatar(
                            // backgroundColor: Colors.red,
                            radius: media.height * 0.03,
                            backgroundImage: const NetworkImage(
                              "https://lh3.googleusercontent.com/a-/AFdZucrUkWpDTDwl2lJVYaegGwPGRQwK1Sx53qTNUieQ=s48-p",
                            ),
                          ),
                          const SizedBox(width: 20),
                          SizedBox(
                            width: media.width * 0.6,
                            height: media.height * 0.07,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 1,
                                ),
                                const Text(
                                  'Raúl Villalobos',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  '"Este Restaurante tiene una comida muy buena"',
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: 10,
                                      decoration: TextDecoration.none),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

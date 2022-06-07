import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SwiperScreen extends StatefulWidget {
  const SwiperScreen({Key? key}) : super(key: key);

  @override
  State<SwiperScreen> createState() => _SwiperScreenState();
}

class _SwiperScreenState extends State<SwiperScreen> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) => OnBoardContent(
                          image: listOnBoard[index].image,
                          title: listOnBoard[index].title,
                          description: listOnBoard[index].description,
                        ),
                    itemCount: listOnBoard.length),
              ),
              Row(
                children: [
                  ...List.generate(
                    listOnBoard.length,
                    (index) => Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: DotIndicator(
                        isActive: index == _currentPage,
                      ),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: CircleBorder()),
                        onPressed: () {
                          if (_currentPage == 4) {
                            Navigator.pushReplacementNamed(context, 'login');
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        },
                        child: Icon(Icons.arrow_forward)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    this.isActive = false,
  }) : super(key: key);

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isActive ? 12 : 4,
      width: 4,
      decoration: BoxDecoration(
        color: isActive ? Colors.yellow[600] : Colors.yellow.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      duration: Duration(milliseconds: 300),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard(
      {required this.image, required this.title, required this.description});
}

final List<OnBoard> listOnBoard = [
  OnBoard(
    image: 'https://assets9.lottiefiles.com/packages/lf20_wpf1kujc.json',
    title: 'Aqui podrás encontrar los lugares más iconicos de Barrancabermeja',
    description:
        'asdasd asd sad as d asd as dsa d asd as das d sad as das d sadsadasduiasd ',
  ),
  OnBoard(
    image: 'https://assets4.lottiefiles.com/private_files/lf30_2n7zxqm7.json',
    title: 'Aqui podrás buscar lugares a tu alrededor',
    description:
        'asdasd asd sad as d asd as dsa d asd as das d sad as das d sadsadasduiasd ',
  ),
  OnBoard(
    image: 'https://assets1.lottiefiles.com/packages/lf20_kpx9c6si.json',
    title: 'Aqui podrás explorar lugares nunca antes vistos',
    description:
        'asdasd asd sad as d asd as dsa d asd as das d sad as das d sadsadasduiasd ',
  ),
  OnBoard(
    image: 'https://assets9.lottiefiles.com/packages/lf20_wyzskmpa.json',
    title:
        'Aqui podrás encontrar todos los lugares marcados de forma facil en tu mapa',
    description:
        'asdasd asd sad as d asd as dsa d asd as das d sad as das d sadsadasduiasd ',
  ),
  OnBoard(
    image: 'https://assets8.lottiefiles.com/packages/lf20_svy4ivvy.json',
    title: 'Aqui podrás navegar de forma sencilla y comoda por la ciudad',
    description:
        'asdasd asd sad as d asd as dsa d asd as das d sad as das d sadsadasduiasd ',
  ),
  OnBoard(
    image: 'https://assets6.lottiefiles.com/packages/lf20_vuai8mk4.json',
    title: 'Aqui podrás encontrar todo al alcance de tu palma ',
    description:
        'asdasd asd sad as d asd as dsa d asd as das d sad as das d sadsadasduiasd ',
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Lottie.network(image, height: 250, width: 250),
        const Spacer(),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          description,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}

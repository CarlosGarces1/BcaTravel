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
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
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
                      padding: const EdgeInsets.only(right: 4),
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
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder()),
                        onPressed: () {
                          if (_currentPage == 3) {
                            Navigator.pushReplacementNamed(context, 'login');
                          } else {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.ease);
                          }
                        },
                        child: const Icon(Icons.arrow_forward)),
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
      duration: const Duration(milliseconds: 300),
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
    image: 'https://assets1.lottiefiles.com/packages/lf20_1t8na1gy.json',
    title: 'Bienvenido',
    description:
        'Bienvenido, esta es tu aplicacion para encontrar los mejores sitios del distrito.',
  ),
  OnBoard(
    image: 'https://assets2.lottiefiles.com/packages/lf20_5ohCYt.json',
    title: 'Encontraras los mejores lugares para descansar',
    description:
        'Descansar es importante para ti, por eso te recomendamos los mejores hoteles.',
  ),
  OnBoard(
    image: 'https://assets7.lottiefiles.com/packages/lf20_YnsM0o.json',
    title: 'Los mejores platos para ti',
    description: 'Tenemos un amplio menu para ofrecerte... ¡y mucho más!',
  ),
  OnBoard(
    image: 'https://assets6.lottiefiles.com/packages/lf20_vuai8mk4.json',
    title: 'Tambien encontraras las rutas a los mejores sitios',
    description: 'Da en siguiente para continuar.',
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
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
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

class TravelPlace {
  TravelPlace({
    required this.name,
    required this.user,
    required this.imagesUrl,
    required this.imagesUrl2,
    this.id = '',
    this.description = '',
    this.locationDesc = '',
    this.statusTag = StatusTag.popular,
    this.shared = 0,
    this.likes = 0,
  });

  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final int shared;
  final int likes;
  final String locationDesc;
  final String description;
  final List<String> imagesUrl;
  final List<String> imagesUrl2;

  static final places = [
    TravelPlace(
      id: '3',
      name: 'Max Burguer 60',
      likes: 500,
      shared: 240,
      description:
          'Este restaurante está orgulloso de su bien trabajado laing, su casera picada y su sabroso rape. Sus comensales dicen que aquí el servicio es divino.',
      imagesUrl: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
      ],
      user: TravelUser.raul,
      locationDesc: 'Calle 60 # 5-20',
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '1',
      name: 'Que Pizza!',
      likes: 140,
      shared: 49,
      description: 'Que Pizzaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa! ',
      imagesUrl: [
        'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1522094522800-6e0189c77a16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1533193773788-92826ee86674?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
      statusTag: StatusTag.evento,
      user: TravelUser.raul,
      locationDesc: 'Cra. 28 #46-31',
      imagesUrl2: [
        'https://images.unsplash.com/photo-1504730655501-24c39ac53f0e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=80',
        'https://images.unsplash.com/photo-1522094522800-6e0189c77a16?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60',
        'https://images.unsplash.com/photo-1533193773788-92826ee86674?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1200&q=60'
      ],
    ),
    TravelPlace(
      id: '2',
      likes: 29,
      shared: 40,
      name: '48 Steak House',
      description: 'Steakkkkkkkkkkkkkkkkkkkkkkk house',
      imagesUrl: [
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
      ],
      statusTag: StatusTag.evento,
      user: TravelUser.carlos,
      locationDesc: 'Cl. 48 #22-115',
      imagesUrl2: [
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
        'http://agenciaobicua.com/steak/wp-content/uploads/MG_9352-Editar.jpg',
      ],
    ),
    TravelPlace(
      id: '4',
      name: 'Pal Caminito',
      shared: 500,
      likes: 39,
      description: 'Pal Caminitooooooooooooooooooo',
      imagesUrl: [
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
      ],
      statusTag: StatusTag.evento,
      user: TravelUser.carlos,
      locationDesc: 'Cl. 46 #25-05',
      imagesUrl2: [
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
        'https://media-cdn.tripadvisor.com/media/photo-w/12/39/bd/86/el-mejor.jpg',
      ],
    ),
  ];
}

class TravelUser {
  TravelUser(this.name, this.urlPhoto);

  final String name;
  final String urlPhoto;

  static TravelUser carlos = TravelUser(
    'Carlos Garcés',
    'https://images.unsplash.com/photo-1457732815361-daa98277e9c8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=60',
  );
  static TravelUser raul = TravelUser(
    'Raúl Villalobos',
    'https://images.unsplash.com/photo-1589304038421-449708a42983?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80',
  );

  static List<TravelUser> users = [carlos, raul];
}

enum StatusTag { popular, evento }

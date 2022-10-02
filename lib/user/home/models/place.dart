class TravelPlace {
  TravelPlace({
    required this.name,
    required this.user,
    required this.imagesUrl,
    required this.imagesUrl2,
    this.id = '',
    this.description = '',
    this.locationDesc = '',
    this.statusTag = StatusTag.transporte,
    this.shared = 0,
    this.likes = 0,
    this.facebook = '',
    this.instagram = '',
    this.web = '',
    this.telefono = '',
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
  final String facebook;
  final String instagram;
  final String web;
  final String telefono;

  static final places = [
    TravelPlace(
      id: '3',
      name: 'Comflubiar',
      likes: 200,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/13z2m1f3/Coom1.jpg',
      ],
      user: TravelUser.raul,
      statusTag: StatusTag.transporte,
      locationDesc: 'Calle 50 #1A - 15',
      telefono: "3212004955",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '1',
      name: 'Café del pescador',
      likes: 30,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/dtMJVBCy/C7.jpg',
        'https://i.postimg.cc/QMN8rdTY/C1.jpg',
        'https://i.postimg.cc/pd02VMQW/C2.jpg',
        'https://i.postimg.cc/Y9ZMgNyT/C3.jpg',
        'https://i.postimg.cc/G3TcRN4R/C4.jpg',
        'https://i.postimg.cc/gJnGnt4v/C5.jpg',
        'https://i.postimg.cc/vTnMv1JT/C6.jpg',
      ],
      user: TravelUser.carlos,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Calle 50 #1A - 15',
      telefono: "3184043608",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '2',
      name: 'Apartahotel Bonilla',
      likes: 100,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/rw0GNqmb/B1.jpg',
        'https://i.postimg.cc/4xD68jH3/B2.jpg',
        'https://i.postimg.cc/zfTn4pTF/B3.jpg',
      ],
      user: TravelUser.carlos,
      statusTag: StatusTag.hotel,
      locationDesc: 'Calle 49 # 13 - 30',
      telefono: "3212004955",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '4',
      name: 'Joelos Express',
      likes: 100,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/CKMq6YLS/j1.jpg',
        'https://i.postimg.cc/CKvf3tzD/j2.jpg',
        'https://i.postimg.cc/bJWSJt0w/j3.jpg',
        'https://i.postimg.cc/wv7sgVmr/J4.jpg',
      ],
      user: TravelUser.carlos,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Calle 52 # 21 - 05',
      telefono: "3025495573",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '5',
      name: 'Parmesano Ristorante',
      likes: 0,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/ZKqXZv7d/p7.jpg',
        'https://i.postimg.cc/k5SkzrjY/P1.jpg',
        'https://i.postimg.cc/76MjP3rg/P2.jpg',
        'https://i.postimg.cc/1XvTwytX/P3.jpg',
        'https://i.postimg.cc/zD749FjN/P4.jpg',
        'https://i.postimg.cc/ZRh1hf2b/p5.jpg',
        'https://i.postimg.cc/4yfqYYXj/p6.jpg',
      ],
      user: TravelUser.raul,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Carrera 20 # 49 - 11',
      telefono: "3223052490",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '6',
      name: 'Hotel Milenium',
      likes: 0,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/y8yfZVbH/M1.jpg',
        'https://i.postimg.cc/fbHB88sq/M2.jpg',
        'https://i.postimg.cc/434WvrDh/M3.jpg',
      ],
      user: TravelUser.raul,
      statusTag: StatusTag.hotel,
      locationDesc: 'Calle 71 # 18 - 09',
      telefono: "3025495573",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
      ],
    ),
    TravelPlace(
      id: '7',
      name: 'Hotel RM',
      likes: 0,
      shared: 240,
      description: 'PROXIMAMENTE.',
      imagesUrl: [
        'https://i.postimg.cc/2SrGms8X/A3.jpg',
        'https://i.postimg.cc/m2xVpzx4/A1.jpg',
        'https://i.postimg.cc/zXn7sz5g/A2.jpg',
        'https://i.postimg.cc/VNNF0Xtq/A4.jpg',
        'https://i.postimg.cc/GmKQpX43/A5.jpg',
      ],
      user: TravelUser.raul,
      statusTag: StatusTag.hotel,
      locationDesc: 'Cra 34 N 39-41',
      telefono: "3003237584",
      imagesUrl2: [
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg',
        'https://www.digame.com.co/wp-content/uploads/2020/05/811cdeb5-7bc3-4e8c-91fa-5f1dae8a7bf6.jpg'
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
    'https://lh3.googleusercontent.com/a-/AFdZucpaioQw3FVX3MKuL26ARCnxTp1LNkbSRPmsNhKjDAo=s288-p-no',
  );
  static TravelUser raul = TravelUser(
    'Raúl Villalobos',
    'https://lh3.googleusercontent.com/a-/ACNPEu99cKtFiTdbsIoniKBjaTBakQaSU5OHx-SUY5xm=s288-p-no',
  );

  static List<TravelUser> users = [carlos, raul];
}

enum StatusTag { hotel, restaurante, transporte }

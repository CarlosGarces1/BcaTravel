class TravelPlace {
  TravelPlace({
    required this.name,
    required this.user,
    required this.imagesUrl,
    this.id = '',
    this.description = '',
    this.locationDesc = '',
    this.statusTag = StatusTag.transporte,
    this.facebook = '',
    this.instagram = '',
    this.web = '',
    this.telefono = '',
    this.whasa = '',
  });

  final String id;
  final String name;
  final TravelUser user;
  final StatusTag statusTag;
  final String locationDesc;
  final String description;
  final List<String> imagesUrl;
  final String facebook;
  final String instagram;
  final String web;
  final String telefono;
  final String whasa;

  static final places = [
    TravelPlace(
        id: '3',
        name: 'Comflubiar',
        description: 'PROXIMAMENTE.',
        user: TravelUser.raul,
        statusTag: StatusTag.transporte,
        locationDesc: 'Calle 50 #1A-15',
        telefono: "3212004955",
        imagesUrl: [
          'assets/fotos/transporte/Coom1.jpg',
        ],
        whasa: 'https://wa.link/woecur',
        facebook:
            'https://www.facebook.com/Coomfluvialtur.Barrancabermeja?_rdc=1&_rdr',
        instagram: 'https://www.instagram.com/coomfluvialtur.bca/?hl=es-la',
        web:
            'https://www.informacolombia.com/directorio-empresas/informacion-empresa/cooperativa-multiactiva-servicios-turisticos-fluvial-terrestre'),
    TravelPlace(
      id: '1',
      name: 'Café del pescador',
      description: 'PROXIMAMENTE.',
      user: TravelUser.carlos,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Corregimiento el Llanito - Cerca a la isla de los mangos',
      telefono: "3184043608",
      imagesUrl: [
        'assets/fotos/comida/C7.jpg',
        'assets/fotos/comida/C1.jpg',
        'assets/fotos/comida/C2.jpg',
        'assets/fotos/comida/C3.jpg',
        'assets/fotos/comida/C4.jpg',
        'assets/fotos/comida/C5.jpg',
        'assets/fotos/comida/C6.jpg',
      ],
      whasa: 'https://wa.link/a1tfee',
      facebook: 'https://www.facebook.com/Primavereame',
      instagram: 'https://www.instagram.com/cafepescador/',
      web:
          'https://linktr.ee/cafedelpescador?fbclid=IwAR1LSHzX1QIu6nu_vaQgpw1IABosO1oEjUgn85ObHc0Y1PrXUYpFNKgslWw',
    ),
    TravelPlace(
        id: '9',
        name: 'FRAPETTO',
        description: 'PROXIMAMENTE.',
        user: TravelUser.raul,
        statusTag: StatusTag.restaurante,
        locationDesc: 'Carrera 20 # 49-53',
        telefono: "3053609909",
        imagesUrl: [
          'assets/fotos/comida/f1.jpg',
          'assets/fotos/comida/f2.jpg',
          'assets/fotos/comida/f3.jpg',
          'assets/fotos/comida/f4.jpg',
          'assets/fotos/comida/f5.jpg',
        ],
        whasa: 'https://wa.link/clon0y',
        facebook: 'https://www.facebook.com/frapetto/',
        web: '',
        instagram: 'https://www.instagram.com/frapetto.cafebar/?hl=es'),
    TravelPlace(
      id: '10',
      name: 'PIZZA EXTREMA',
      description: 'PROXIMAMENTE.',
      user: TravelUser.carlos,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Calle 50 # 18 - 75',
      telefono: "(607)6113941",
      imagesUrl: [
        'assets/fotos/comida/Dp 1.jpg',
        'assets/fotos/comida/dp2.jpg',
        'assets/fotos/comida/dp3.jpg',
        'assets/fotos/comida/dp4.jpg',
        'assets/fotos/comida/dp5.jpg',
      ],
      whasa: 'https://wa.link/zx0bm3',
      facebook: 'https://es-la.facebook.com/pizzaextrema2001/',
      instagram: 'https://www.instagram.com/pizzaextrema/?hl=es',
      web: '',
    ),
    TravelPlace(
      id: '4',
      name: 'Joelos Express',
      description: 'PROXIMAMENTE.',
      user: TravelUser.carlos,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Calle 52 # 21-05',
      telefono: "3025495573",
      imagesUrl: [
        'assets/fotos/comida/j1.jpg',
        'assets/fotos/comida/j2.jpg',
        'assets/fotos/comida/j3.jpg',
        'assets/fotos/comida/J4.jpg',
      ],
      whasa: 'https://wa.link/psbm9s',
      facebook: 'https://www.facebook.com/Joelos.bca/?_rdc=1&_rdr',
      instagram: 'https://www.instagram.com/joelos.bca/?hl=es',
      web: '',
    ),
    TravelPlace(
      id: '5',
      name: 'Parmesano Ristorante',
      description: 'PROXIMAMENTE.',
      user: TravelUser.raul,
      statusTag: StatusTag.restaurante,
      locationDesc: 'Carrera 20 # 49-11',
      telefono: "3223052490",
      imagesUrl: [
        'assets/fotos/comida/P1.jpg',
        'assets/fotos/comida/P2.jpg',
        'assets/fotos/comida/P3.jpg',
        'assets/fotos/comida/P4.jpg',
        'assets/fotos/comida/p5.jpg',
        'assets/fotos/comida/p6.jpg',
        'assets/fotos/comida/p7.jpg',
      ],
      whasa: 'https://wa.link/g9rvw9',
      facebook: 'https://www.facebook.com/parmesanoristorante/?_rdc=1&_rdr',
      instagram: 'https://www.instagram.com/parmesanoristorante/?hl=es',
      web: '',
    ),
    TravelPlace(
      id: '2',
      name: 'Apartahotel Bonilla',
      description: 'PROXIMAMENTE.',
      user: TravelUser.carlos,
      statusTag: StatusTag.hotel,
      locationDesc: 'Calle 49 # 13-30',
      telefono: "3212004955",
      imagesUrl: [
        'assets/fotos/hoteles/B1.jpg',
        'assets/fotos/hoteles/B2.jpg',
        'assets/fotos/hoteles/B3.jpg',
      ],
      whasa: 'https://wa.link/xc9i02',
      facebook: 'https://www.facebook.com/hotelrmbarrancabermeja/?_rdc=1&_rdr',
      instagram: '',
      web: '',
    ),
    TravelPlace(
      id: '6',
      name: 'Hotel Milenium',
      description: 'PROXIMAMENTE.',
      user: TravelUser.raul,
      statusTag: StatusTag.hotel,
      locationDesc: 'Calle 71 # 18-09',
      telefono: "3004932950",
      imagesUrl: [
        'assets/fotos/hoteles/M1.jpg',
        'assets/fotos/hoteles/M2.jpg',
        'assets/fotos/hoteles/M3.jpg',
      ],
      whasa: 'https://wa.link/zcpclj',
      facebook: 'https://www.facebook.com/HotelMillenium/?_rdc=2&_rdr',
      instagram: 'https://www.instagram.com/hotelmillenium/',
      web:
          'https://hotelmilleniumbarrancabermeja.negocio.site/?utm_source=gmb&utm_medium=referral',
    ),
    TravelPlace(
      id: '7',
      name: 'Hotel RM',
      description: 'PROXIMAMENTE.',
      user: TravelUser.raul,
      statusTag: StatusTag.hotel,
      locationDesc: 'Carrera 34 # 39-41',
      telefono: "3003237584",
      imagesUrl: [
        'assets/fotos/hoteles/A1.jpg',
        'assets/fotos/hoteles/A2.jpg',
        'assets/fotos/hoteles/A3.jpg',
        'assets/fotos/hoteles/A4.jpg',
        'assets/fotos/hoteles/A5.jpg',
      ],
      whasa: 'https://wa.link/ns2dww',
      facebook: 'https://www.facebook.com/hotelrmbarrancabermeja/?_rdc=2&_rdr',
      instagram: 'https://www.instagram.com/rmhotelbarrancabermeja/?hl=es-la',
      web: '',
    ),
    TravelPlace(
      id: '8',
      name: 'Hotel Colonial',
      description: 'PROXIMAMENTE.',
      user: TravelUser.carlos,
      statusTag: StatusTag.hotel,
      locationDesc: 'Carrera 20 # 53-41',
      telefono: "3176390499",
      imagesUrl: [
        'assets/fotos/hoteles/c2.jpg',
        'assets/fotos/hoteles/c3.jpg',
        'assets/fotos/hoteles/c4.jpg',
        'assets/fotos/hoteles/C5.jpg',
      ],
      whasa: 'https://wa.link/ch79ci',
      facebook: 'https://www.facebook.com/Hotelcolonial25/',
      instagram: '',
      web: 'https://www.hotelenbarrancabermeja.com.co/index.html',
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

class Categories1 {
  Categories1({
    required this.name,
    this.id = '',
    required this.imagesUrl,
  });

  final String id;
  final String name;
  final List<String> imagesUrl;

  static final places = [
    Categories1(
      id: '1',
      name: 'Transporte',
      imagesUrl: [
        'assets/fotos/transporte/Coom1.jpg',
      ],
    ),
    Categories1(
      id: '2',
      name: 'Hoteleria',
      imagesUrl: [
        'assets/fotos/hoteles/M1.jpg',
      ],
    ),
    Categories1(
      id: '3',
      name: 'Gastronomia',
      imagesUrl: [
        'assets/fotos/comida/P2.jpg',
      ],
    ),
  ];
}

enum StatusTag { hotel, restaurante, transporte }

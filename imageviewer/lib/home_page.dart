import 'package:flutter/material.dart';
import 'details_page.dart';

List<ImageDetails> _images = [
  ImageDetails(
    imagePath: 'images/1.png',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  ),
  ImageDetails(
    imagePath: 'images/2.jpg',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  ),
  ImageDetails(
    imagePath: 'images/3.jpg',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  ),
  ImageDetails(
    imagePath: 'images/4.jpg',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  ),
  ImageDetails(
    imagePath: 'images/5.jpg',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  ),
  ImageDetails(
    imagePath: 'images/6.jpg',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  ),
  ImageDetails(
    imagePath: 'images/7.jpg',
    title: 'Zorro',
    details:
        'Se conoce como zorro, zorra o raposos a unas diez especies de mamíferos cuadrúpedos de la familia de los cánidos, en apariencia semejantes a un perro de tamaño medio con orejas puntiagudas, hocico largo y delgado, y cola y cuerpo peludos.',
  )
];

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              'Animales',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return RawMaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsPage(
                              imagePath: _images[index].imagePath,
                              title: _images[index].title,
                              details: _images[index].details,
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'logo$index',
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage(_images[index].imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: _images.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ImageDetails {
  final String imagePath;
  final String title;
  final String details;
  ImageDetails({
    required this.imagePath,
    required this.title,
    required this.details,
  });
}

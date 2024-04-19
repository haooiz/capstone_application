import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() {
  runApp(MyApp());
}

class Animal {
  String name;
  int age;
  String temperament;
  String imageUrl;

  Animal(
      {required this.name,
      required this.age,
      required this.temperament,
      required this.imageUrl});
}

class MyApp extends StatelessWidget {
  final List<Animal> animals = [
    Animal(name: '강아지', age: 2, temperament: '활발함', imageUrl: 'assets/dog.jpg'),
    // 다른 동물들도 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Cards',
      home: Scaffold(
        appBar: AppBar(
          title: Text('WALKIE'),
        ),
        body: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return AnimalCard(
              animal: animals[index],
            );
          },
          itemCount: animals.length,
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      ),
    );
  }
}

class AnimalCard extends StatelessWidget {
  final Animal animal;

  AnimalCard({required this.animal});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Image.asset(
            animal.imageUrl,
            fit: BoxFit.cover,
            width: double.infinity,
            height: 200.0,
          ),
          ListTile(
            title: Text(animal.name),
            subtitle: Text('나이: ${animal.age}, 성격: ${animal.temperament}'),
          ),
          ButtonBar(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.thumb_up),
                onPressed: () {
                  // 좋아요 버튼을 눌렀을 때의 동작
                },
              ),
              IconButton(
                icon: Icon(Icons.star),
                onPressed: () {
                  // 별 버튼을 눌렀을 때의 동작
                },
              ),
              IconButton(
                icon: Icon(Icons.thumb_down),
                onPressed: () {
                  // 싫어요 버튼을 눌렀을 때의 동작
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

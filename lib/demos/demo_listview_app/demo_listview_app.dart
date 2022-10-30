import 'package:flutter/material.dart';

class DemoListviewApp extends StatefulWidget {
  const DemoListviewApp({super.key});

  @override
  State<DemoListviewApp> createState() => _DemoListviewAppState();
}

class ProjectPaddings {
  final EdgeInsets paddingHorizontalPage =
      const EdgeInsets.symmetric(horizontal: 50);
  final EdgeInsets paddingVerticalBetweenCards =
      const EdgeInsets.symmetric(vertical: 30);
  final EdgeInsets paddingCard = const EdgeInsets.all(20);
  final EdgeInsets paddingRow = const EdgeInsets.only(top: 20);
}

class _DemoListviewAppState extends State<DemoListviewApp> {
  final String _title = 'My Collections';
  final List<CollectionModel> _items = CollectionDummyData().items;
  final projectPaddings = ProjectPaddings();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: ListView.builder(
          padding: projectPaddings.paddingHorizontalPage,
          itemCount: _items.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: projectPaddings.paddingVerticalBetweenCards,
              child: _CollectionCard(
                  projectPaddings: projectPaddings, model: _items[index]),
            );
          }),
        ));
  }
}

class _CollectionCard extends StatelessWidget {
  const _CollectionCard({
    Key? key,
    required this.projectPaddings,
    // required List<CollectionModel> items,
    required CollectionModel model,
    // required this.index,
  })  : _model = model,
        // _items = item,
        super(key: key);

  final ProjectPaddings projectPaddings;
  // final List<CollectionModel> _items;
  final CollectionModel _model;
  // final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: projectPaddings.paddingCard,
        child: Column(
          children: [
            _roundedImage(),
            Padding(
              padding: projectPaddings.paddingRow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [_caption(context), _price(context)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Text _price(BuildContext context) {
    return Text(
      '${_model.price} ETH',
      style: Theme.of(context).textTheme.caption,
    );
  }

  Text _caption(BuildContext context) {
    return Text(
      _model.headline,
      style: Theme.of(context).textTheme.headline6,
    );
  }

  ClipRRect _roundedImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          _model.imagePath,
        ));
  }
}

class CollectionDummyData {
  late final List<CollectionModel> items;

  CollectionDummyData() {
    items = [
      CollectionModel(
          imagePath: ProjectImages.collectionImagePath,
          headline: 'Abstract Art',
          price: 3.4),
      CollectionModel(
          imagePath: ProjectImages.collectionImagePath,
          headline: 'Abstract Shape',
          price: 4.5),
      CollectionModel(
          imagePath: ProjectImages.collectionImagePath,
          headline: 'Meloy Screen',
          price: 1.2),
      CollectionModel(
          imagePath: ProjectImages.collectionImagePath,
          headline: 'SciF-Art',
          price: 7.7),
      CollectionModel(
          imagePath: ProjectImages.collectionImagePath,
          headline: 'Abstract Creativity',
          price: 9.1),
    ];
  }
}

class ProjectImages {
  static const collectionImagePath = 'https://picsum.photos/300/200';
}

class CollectionModel {
  CollectionModel({
    required this.imagePath,
    required this.headline,
    required this.price,
  });

  final String imagePath;
  final String headline;
  final double price;
}

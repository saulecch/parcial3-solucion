import 'package:flutter/material.dart';

class PlacesCard extends StatelessWidget {
  final String image, title, description;
  final bool visited;
  const PlacesCard({
    required this.image,
    required this.title,
    required this.description,
    required this.visited,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 248,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.transparent,
              Colors.transparent,
              Colors.black54
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0, 0.6, 1],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                  right: 0,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.only(topRight:Radius.circular(15),bottomLeft: Radius.circular(15))
                      ),
                      child: Icon(visited ? Icons.flag : Icons.flag_outlined,color: visited ? Colors.red : Colors.white,))),
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class VisitedCard extends StatelessWidget {
  final String image, title;
  const VisitedCard({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.all(Radius.circular(15))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 180,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(image)),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15))),
          ),
          const SizedBox(
            width: 30,
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline4
                ?.copyWith(color: Colors.black),
          )
        ],
      ),
    );
  }
}
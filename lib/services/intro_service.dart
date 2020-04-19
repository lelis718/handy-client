import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:handyclientapp/model/card_info.dart';

abstract class IntroService {
  List<CardInfo> getCards();
}

class IntroServiceDefault extends IntroService {
  List<CardInfo> getCards() {
    List<CardInfo> cards = new List<CardInfo>();
    cards.add(
      new CardInfo(
        title: "Welcome to Handy!",
        icon: FontAwesomeIcons.smileBeam,
        color: Colors.lightBlueAccent,
      ),
    );
    cards.add(
      new CardInfo(
        title: "Need some help?",
        icon: FontAwesomeIcons.questionCircle,
        color: Colors.lightBlueAccent,
      ),
    );
    cards.add(
      new CardInfo(
        title: "Add local and what you are planning to do",
        icon: FontAwesomeIcons.searchLocation,
        color: Colors.lightBlueAccent,
      ),
    );
    cards.add(
      new CardInfo(
        title: "Someone will receive your request to give you a hand!",
        icon: FontAwesomeIcons.smileWink,
        color: Colors.lightBlueAccent,
      ),
    );
    cards.add(
      new CardInfo(
        title: "Want to help someone?",
        icon: FontAwesomeIcons.peopleCarry,
        color: Colors.lightBlueAccent,
      ),
    );
    cards.add(
      new CardInfo(
        title: "Swipe between the cards for give a hand to someone. ",
        icon: FontAwesomeIcons.arrowsAltH,
        color: Colors.lightBlueAccent,
      ),
    );
    cards.add(
      new CardInfo(
        title: "Shall we begin?",
        icon: FontAwesomeIcons.smileBeam,
        color: Colors.lightBlueAccent,
      ),
    );

    return cards;
  }
}

class Contact {
  String name;
  String number;

  Contact({
    required this.name,
    required this.number,
  });


  get contactText => null;
  static List<Contact> contactList(){
    return[
      Contact(name: "muhammad waqar", number: "03085287503", ),
      Contact(name: "muhammad bilal", number: "03075767049", ),
      Contact(name: "abu", number: "03018149617", ),
      Contact(name: "humira api", number: "03085957517", ),
      Contact(name: "tanveer bhai", number: "03056385465", ),
    ];
  }
}
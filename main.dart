class BusCard {
  String _owner = '';
  int _balance = 0;

  // Constructor
  BusCard(String owner, int balance) {
    _owner = owner;
    _balance = balance;
  }

  // TODO 1: Getter for balance
  int get balance {
    return _balance;
  }

  // Getter for owner
  String get owner {
    return _owner;
  }

  // Setter for owner
  set owner(String newName) {
    if (newName.length < 3) {
      print('Error: name too short');
    } else {
      _owner = newName;
    }
  }

  // Show card information
  void showInfo() {
    print('Owner: $_owner | Balance: $_balance RWF');
  }

  // TODO 2: Top-up method
  void topUp(int amount) {
    if (amount >= 500 && amount <= 50000) {
      _balance += amount;
      print('Topped up $amount RWF');
    } else {
      print('Error: top-up must be 500 to 50000 RWF');
    }
  }

  // TODO 3: Pay method
  void pay(int fare) {
    if (fare > _balance) {
      print('Card declined');
    } else {
      _balance -= fare;
      print('Paid $fare RWF');
    }
  }
}

// StudentCard inherits from BusCard
class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor
  StudentCard(String owner, int balance, int discount)
      : super(owner, balance) {
    _discount = discount;
  }

  // Override showInfo
  @override
  void showInfo() {
    super.showInfo();
    print('Student card: $_discount% off');
  }

  // TODO 4: Override pay method
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;

    print('Student discount: $off RWF');

    super.pay(fare - off);
  }
}

void main() {
  // My numbers: D = 87, L = 7
  // Starting balance = 1870 RWF
  // Bus fare = 287 RWF
  // Discount = 17%

  // Create a normal BusCard
  BusCard card = BusCard('Tuyishimire Jean Claude', 1870);

  // Test setter
  card.owner = 'Al';
  card.showInfo();

  // TODO 5: Change owner to full name
  card.owner = 'Tuyishimire Jean Claude';
  card.showInfo();

  // TODO 6: Test top-up
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: Pay bus fare two times
  card.pay(287);
  card.pay(287);
  card.showInfo();

  // TODO 8: Create StudentCard
  StudentCard studentCard =
      StudentCard('Tuyishimire Jean Claude', 1870, 17);

  // TODO 9: Pay bus fare with student card
  studentCard.pay(287);
  studentCard.showInfo();
}

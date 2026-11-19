class BusCard {
String _owner = '';
int _balance = 0;
// Constructor (done for you)
BusCard(String owner, int balance) {
_owner = owner;
_balance = balance;
}
// EXAMPLE: getter for owner (done for you)
String get owner {
return _owner;
}
// TODO 1: write a getter for balance
// Hint: copy the style of the owner getter. Balance is an int.
// EXAMPLE: setter for owner, with a rule (done for you)
set owner(String newName) {
if (newName.length < 3) {
print('Error: name too short');
} else {
_owner = newName;
}
}
// EXAMPLE: a method (done for you)
void showInfo() {
print('Owner: $_owner | Balance: $_balance RWF');
}
// TODO 2: write a method topUp(int amount)
// Rule: only accept amounts from 500 to 50000 RWF.
// OK -> add amount to _balance, print 'Topped up <amount> RWF'
// Not OK -> print 'Error: top-up must be 500 to 50000 RWF'
// Hint: use if / else, like the owner setter.
  // TODO 3: write a method pay(int fare)
// fare is more than _balance -> print 'Card declined'
// otherwise -> subtract fare from _balance, print 'Paid <fare> RWF'
}



class StudentCard extends BusCard {
  int _discount = 0;

  // Constructor (done for you)
  // ": super(owner, balance)" builds the parent BusCard first
  StudentCard(String owner, int balance, int discount) : super(owner, balance) {
    _discount = discount;
  }

  // EXAMPLE: override showInfo (done for you)
  @override
  void showInfo() {
    super.showInfo(); // run the parent's showInfo first
    print('Student card: $_discount% off');
  }

  // TODO 4: override pay(int fare)
  @override
  void pay(int fare) {
    int off = fare * _discount ~/ 100;
    print('Student discount: $off RWF');
    super.pay(fare - off);
  }
}


void main() {
  // My numbers: D = 87, L = 7
  // Starting balance = 1870 RWF, Bus fare = 287 RWF, Discount = 17%

  // EXAMPLE (done for you): create a card and test the setter
  BusCard card = BusCard('Tuyishimire Jean Claude', 1870);
  card.owner = 'Al'; // refused: name too short
  card.showInfo();

  // TODO 5: change the owner to your full name, then call showInfo()
  card.owner = 'Tuyishimire Jean Claude';
  card.showInfo();

  // TODO 6: top up 100 RWF (must be refused), then top up 2000 RWF
  card.topUp(100);
  card.topUp(2000);

  // TODO 7: pay your bus fare 2 times, then call showInfo()
  card.pay(287);
  card.pay(287);
  card.showInfo();

  // TODO 8: create a StudentCard with your name, starting balance and discount
  StudentCard studentCard = StudentCard('Tuyishimire Jean Claude', 1870, 17);

  // TODO 9: pay your bus fare with the student card, then call showInfo()
  studentCard.pay(287);
  studentCard.showInfo();
}

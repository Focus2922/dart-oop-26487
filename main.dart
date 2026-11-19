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



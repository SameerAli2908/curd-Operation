import 'dart:io';

// Laptop Class
class Laptop {
  double price;
  double warrantyCost;
  double accessoriesCost;
  double maintenanceCost;
  double tax;

  Laptop({
    required this.price,
    required this.warrantyCost,
    required this.accessoriesCost,
    required this.maintenanceCost,
    required this.tax,
  });

  // Total Expense
  double totalExpense() {
    return price + warrantyCost + accessoriesCost + maintenanceCost + tax;
  }

  // Display
  void display() {
    print("\n===== Laptop Details =====");
    print("Price: $price");
    print("Warranty Cost: $warrantyCost");
    print("Accessories Cost: $accessoriesCost");
    print("Maintenance Cost: $maintenanceCost");
    print("Tax: $tax");
    print("Total Expense: ${totalExpense()}");
  }
}

void main() {
  List<Laptop> laptops = [];

  while (true) {
    print("\n==== LAPTOP CRUD MENU ====");
    print("1. Add Laptop");
    print("2. Show Laptops");
    print("3. Update Laptop");
    print("4. Delete Laptop");
    print("5. Exit");

    stdout.write("Enter choice: ");
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      // CREATE
      case 1:
        stdout.write("Enter Price: ");
        double price = double.parse(stdin.readLineSync()!);

        stdout.write("Enter Warranty Cost: ");
        double warranty = double.parse(stdin.readLineSync()!);

        stdout.write("Enter Accessories Cost: ");
        double accessories = double.parse(stdin.readLineSync()!);

        stdout.write("Enter Maintenance Cost: ");
        double maintenance = double.parse(stdin.readLineSync()!);

        stdout.write("Enter Tax: ");
        double tax = double.parse(stdin.readLineSync()!);

        laptops.add(
          Laptop(
            price: price,
            warrantyCost: warranty,
            accessoriesCost: accessories,
            maintenanceCost: maintenance,
            tax: tax,
          ),
        );

        print("Laptop Added!");
        break;

      // READ
      case 2:
        if (laptops.isEmpty) {
          print("No laptops found");
        } else {
          for (int i = 0; i < laptops.length; i++) {
            print("\nIndex: $i");
            laptops[i].display();
          }
        }
        break;

      // UPDATE
      case 3:
        stdout.write("Enter index to update: ");
        int index = int.parse(stdin.readLineSync()!);

        if (index >= 0 && index < laptops.length) {
          stdout.write("New Price: ");
          laptops[index].price = double.parse(stdin.readLineSync()!);

          stdout.write("New Warranty Cost: ");
          laptops[index].warrantyCost = double.parse(stdin.readLineSync()!);

          stdout.write("New Accessories Cost: ");
          laptops[index].accessoriesCost = double.parse(stdin.readLineSync()!);

          stdout.write("New Maintenance Cost: ");
          laptops[index].maintenanceCost = double.parse(stdin.readLineSync()!);

          stdout.write("New Tax: ");
          laptops[index].tax = double.parse(stdin.readLineSync()!);

          print("Laptop Updated!");
        } else {
          print("Invalid Index");
        }
        break;

      // DELETE
      case 4:
        stdout.write("Enter index to delete: ");
        int index = int.parse(stdin.readLineSync()!);

        if (index >= 0 && index < laptops.length) {
          laptops.removeAt(index);
          print("Laptop Deleted!");
        } else {
          print("Invalid Index");
        }
        break;

      // EXIT
      case 5:
        print("Program Closed");
        return;

      default:
        print("Invalid Choice");
    }
  }
}

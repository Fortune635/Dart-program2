// 🛒 Online Shopping Cart System in Dart
// Author: Akioya Fortune
// Description: Demonstrates filtering, discount application, tax calculation,
// and factorial-based discounts using anonymous, higher-order, and recursive functions.

void main() {
  print("🛍️ Welcome to Akioya’s Dart Online Store!");

  // Initial shopping cart items (prices in USD)
  List<double> cart = [5.0, 12.5, 25.0, 9.0, 50.0, 100.0];
  print("\nOriginal Cart Items: $cart");

  // Step 1: Filter Items (Remove items below $10 using an anonymous function)
  List<double> filteredCart = cart.where((price) => price >= 10).toList();
  print("\nFiltered Cart (≥ \$10): $filteredCart");

  // Step 2: Apply Discount (Higher-order function)
  List<double> discountedCart = applyDiscount(filteredCart, 10); // 10% off
  print("\nAfter 10% Discount: $discountedCart");

  // Step 3: Calculate Total (with optional tax)
  double totalWithTax = calculateTotal(discountedCart, taxRate: 0.07); // 7% tax
  print("\nTotal (after tax): \$${totalWithTax.toStringAsFixed(2)}");

  // Step 4: Factorial Discount (Recursive function)
  int itemCount = discountedCart.length;
  int factorialValue = factorial(itemCount);
  double extraDiscount = factorialValue * 0.1; // 0.1 per factorial point
  double finalTotal = totalWithTax - extraDiscount;

  print("\nFactorial Discount (${itemCount}! = $factorialValue) → -\$${extraDiscount.toStringAsFixed(2)}");
  print("\n💰 Final Price After All Discounts: \$${finalTotal.toStringAsFixed(2)}");

  print("\n✅ Transaction Complete — Thanks for shopping with Akioya Fortune!");
}

// -------------------------------------------------------------
// Higher-order function: Applies a percentage discount to each item
// -------------------------------------------------------------
List<double> applyDiscount(List<double> prices, double discountPercent) {
  return prices.map((price) => price - (price * discountPercent / 100)).toList();
}

// -------------------------------------------------------------
// Function with optional parameter: Calculates total with optional tax
// -------------------------------------------------------------
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.reduce((a, b) => a + b);
  double tax = subtotal * taxRate;
  return subtotal + tax;
}

// -------------------------------------------------------------
// Recursive function: Calculates factorial of a number
// -------------------------------------------------------------
int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

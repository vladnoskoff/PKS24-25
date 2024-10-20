class CartItem {
  final String title;
  final String duration;
  final String price;
  int quantity;

  CartItem({
    required this.title,
    required this.duration,
    required this.price,
    int? quantity, // Allow nullable input, default to 1 if null
  }) : quantity = quantity ?? 1;
}


// Global list to store the cart items
List<CartItem> cartItems = [];

void addToCart(String title, String duration, String price) {
  // Check if the item already exists in the cart
  int index = cartItems.indexWhere((item) => item.title == title);
  if (index != -1) {
    // If it exists, increase the quantity
    cartItems[index].quantity++;
  } else {
    // If it does not exist, add a new item with default quantity
    cartItems.add(CartItem(title: title, duration: duration, price: price));
  }
}

// Function to remove an item from the cart
void removeFromCart(String title) {
  cartItems.removeWhere((item) => item.title == title);
}

// Function to change the quantity of an item in the cart
void updateCartItemQuantity(String title, int newQuantity) {
  int index = cartItems.indexWhere((item) => item.title == title);
  if (index != -1) {
    cartItems[index].quantity = newQuantity;
    // Remove the item if the new quantity is less than 1
    if (cartItems[index].quantity < 1) {
      cartItems.removeAt(index);
    }
  }
}

// Function to calculate the total price
double calculateTotalPrice() {
  double total = 0;
  for (var item in cartItems) {
    total += double.parse(item.price.replaceAll(RegExp(r'[^0-9]'), '')) * item.quantity;
  }
  return total;
}

int convertStringToInt(String? input) {
  if (input == null) {
    return 0;
  }
  if (input.startsWith("+")) {
    input = input.substring(1); // Remove the "+" character
  }

  return int.tryParse(input) ??
      0; // Convert to integer or return 0 if parsing fails
}

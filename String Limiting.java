public class limiting {
    public static void main(String[] args) {
        String str = "zzzbzz"; // Input string
        StringBuilder sb = new StringBuilder(); // StringBuilder to build the output string

        int count = 1; // Counter for consecutive characters
        char previousChar = '\0'; // Variable to keep track of the previous character

        for (int i = 0; i < str.length(); i++) {
            char currentChar = str.charAt(i);

            // Check if the current character is the same as the previous one
            if (currentChar == previousChar) {
                count++; // Increment the count of consecutive characters
            } else {
                count = 1; // Reset count for a new character
            }

            // If count is less than or equal to 2, append to StringBuilder
            if (count <= 2) {
                sb.append(currentChar);
            }

            // Update the previous character
            previousChar = currentChar;
        }

        // Print the result
        System.out.println("Output: " + sb.toString());
    }
}
# Smalltalk Polygon Geometry

An object-oriented geometric shapes library implemented in Smalltalk. This project was developed for a Programming Languages course to demonstrate deep understanding of pure object-oriented paradigms, including class inheritance, operator overloading, and dynamic polymorphism.

## Core Architecture

The architecture is built around a single inheritance tree:
* **`Wielokat` (Polygon):** The abstract base class that encapsulates common properties such as the shape's name and its array of vertices. It defines universal methods for printing the state of the object and scaling its coordinates.
* **`Kwadrat` (Square):** A concrete subclass that initializes a 4-vertex polygon based on a single side length.
* **`Romb` (Rhombus):** A concrete subclass that calculates its vertices dynamically based on a given side length and an angle.

## Implemented Features

1. **Area-based Addition (Operator Overloading):** The `+` operator is overloaded. Adding two shapes calculates the sum of their areas and returns a completely new instance of the receiver's class, scaled proportionally to match the combined area.
2. **Geometric Congruency (Operator Overloading):** The `=` operator is overloaded to check for congruency rather than object identity. Two shapes are considered equal if their core dimensions (e.g., side lengths and angles) match, regardless of their position in the coordinate system.
3. **Shape Transformations:** Includes a `skaluj:` (scale) method that mathematically multiplies the coordinates of all vertices by a given scalar factor, adjusting the shape's size dynamically.
4. **State Printing:** The `drukuj` method outputs a formatted string containing the shape's name, the coordinates of all its vertices, and its calculated area.

## Execution

This script is meant to be run in a standard GNU Smalltalk environment. 

1. Ensure you have GNU Smalltalk (`gst`) installed on your system.
2. Clone the repository.
3. Run the script from the terminal to see the execution of the test cases:
   ```bash
   gst SmallTalkGr70.st

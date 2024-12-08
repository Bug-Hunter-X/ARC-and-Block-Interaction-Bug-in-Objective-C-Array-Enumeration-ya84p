# Objective-C ARC and Block Interaction Bug

This repository demonstrates a subtle bug that can occur in Objective-C when using Automatic Reference Counting (ARC) with blocks and array modifications.  The bug arises when attempting to remove objects from an array while iterating over it using `enumerateObjectsUsingBlock`. This can lead to skipped elements or unexpected crashes due to index inconsistencies.

The `bug.m` file shows the problematic code, while `bugSolution.m` presents a corrected approach.

## How to Reproduce

1. Clone this repository.
2. Open the project in Xcode.
3. Run the code; observe the unexpected behavior in `bug.m`.
4. Compare with the corrected solution in `bugSolution.m`.

## Solution

The solution involves creating a mutable copy of the array and then iterating over the copy to perform the removals.  This eliminates the risk of modifying the array while traversing it. 
The solution avoids modifying the array during enumeration. Create a copy to safely remove objects:

```objectivec
- (void)someMethod {
    NSMutableArray *copyArray = [self.myArray mutableCopy];
    [copyArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (someCondition) {
            [self.myArray removeObject:obj];
        }
    }];

    // Alternatively, use a filtered array to avoid the need for explicit removal:
    //  self.myArray = [[self.myArray filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
    //       return !someCondition;
    //   }]] mutableCopy]; 
}
```

This revised code creates a mutable copy (`copyArray`) to safely remove objects from the original array (`self.myArray`) without causing unexpected behavior.
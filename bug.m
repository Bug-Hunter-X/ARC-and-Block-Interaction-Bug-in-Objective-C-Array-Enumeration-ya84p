In Objective-C, a rare but frustrating bug can occur due to the interaction between ARC (Automatic Reference Counting) and blocks.  Consider this scenario: 

```objectivec
@property (nonatomic, strong) NSMutableArray *myArray;

- (void)someMethod {
    [self.myArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        // ... some operation on obj ...
        if (someCondition) {
            [self.myArray removeObject:obj];  // Potential bug here!
        }
    }];
}
```

Modifying `myArray` inside the enumeration block while iterating over it leads to undefined behavior. Removing an object shifts the indices of subsequent objects, potentially causing skips or crashes.  The exact behavior is unpredictable and depends on the internal implementation of `enumerateObjectsUsingBlock`. 
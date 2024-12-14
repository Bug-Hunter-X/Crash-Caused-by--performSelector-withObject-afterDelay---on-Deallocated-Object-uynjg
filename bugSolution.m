To prevent this crash, avoid using `performSelector:withObject:afterDelay:` when dealing with potential object deallocation. Instead, use Grand Central Dispatch (GCD) or blocks for asynchronous operations. This ensures proper management of object lifecycles.

Here's an example of how to refactor the problematic code using GCD:

```objectivec
- (void)someMethod {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
        if (self) { //Check if self still exists
            [self doSomething];
        }
    });
}
```
This solution utilizes a block and ensures that the `doSomething` selector is only called if the object `self` is still valid.  The block captures a strong reference to `self` implicitly, preventing premature deallocation.
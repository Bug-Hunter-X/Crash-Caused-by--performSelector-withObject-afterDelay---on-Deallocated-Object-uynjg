# Crash Caused by `performSelector:withObject:afterDelay:` on Deallocated Object

This repository demonstrates a common but subtle bug in Objective-C related to the use of `performSelector:withObject:afterDelay:`.  If the object on which the selector is invoked is deallocated before the delay elapses, the application will crash.

The `bug.m` file showcases the problematic code. The `bugSolution.m` file offers a solution using blocks and GCD for robust asynchronous operation.

## Problem

When using `performSelector:withObject:afterDelay:`, there's a risk that the object may be deallocated prematurely, resulting in a crash. This often manifests in scenarios involving asynchronous operations and weak references.
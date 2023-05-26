# MathPlus

This library that solves various mathematical problems

## Features

- Rounding floating point numbers to a specified number of decimal places
- Calculating the value of a certain integral using three numerical methods:: methods of left and right rectangles, trapezoid method
- Сalculation of the value of a nonlinear function using three numerical methods: iteration method, dichotomy and chord methods

## Support

Please see information about MathParser from davedelong: https://github.com/davedelong/DDMathParser/wiki

## Usage

### Rounding floating point numbers

```swift
let number = Number.round(number: 1,0234, digits: 2);
```

### Calculating the value of a certain integral

```swift
let integral = Integral(_f: "$x**2", _a: 1, _b: 2);

// method left rectangle
integral.solve(solutionMethod: Integral.SolutionMethod.LeftRectangle, n: 10);

//right rectangle method
integral.solve(solutionMethod: Integral.SolutionMethod.RightRectangle, n: 10);

//trapezoid method
integral.solve(solutionMethod: Integral.SolutionMethod.Trapeze, n: 10)
```

### Сalculation of the value of a nonlinear function

```swift
let nonlinearFunc = NonlinearFunc(_f: "$x**2");

//iteration method
nonlinearFunc.solve(x: 7, e: 0.001);

//dichotomy method
nonlinearFunc.solve(solutionMethod: NonlinearFunc.SolutionMethod.Dichotomy, x0: 1, x1: 2, e: 0.001);

//chord method
nonlinearFunc.solve(solutionMethod: NonlinearFunc.SolutionMethod.Chord, x0: 1, x1: 2, e: 0.001);
```

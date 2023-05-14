import Foundation
import MathParser

public class NonlinearFunc
{
    public enum SolutionMethod
    {
        case Chord
        case Dichotomy
    }
    
    public var f: String;
    
    public init()
    {
        f = "";
    }
    
    public init(_f: String)
    {
        f = _f;
    }
    
    ///Solves a nonlinear function
    ///- Parameters:
    ///     - x:  Value of the function argument
    ///     - e: Accuracy of the solution
    ///- Returns: Numerical value of the function
    public func solve(x: Double, e: Double) -> Double
    {
        if (!f.isEmpty)
        {
            var xCurr: Double;
            var xNext: Double = x;
            
            repeat
            {
                xCurr = xNext;
                xNext = try! f.evaluate(["x": xNext]);
            }
            while(abs(xCurr - xNext) > e)
                    
            return xNext;
        }
        
        return 0;
    }
    
    ///Solves a nonlinear function
    ///- Parameters:
    ///     - solutionMethod: Nonlinear function solution method
    ///     - x0: Left border of the interval
    ///     - x1: Right border of the interval
    ///     - e: Accuracy of the solution
    /// - Returns: Numerical value of the function
    public func solve(solutionMethod: SolutionMethod, x0: Double, x1: Double, e: Double) -> Double
    {
        if (!f.isEmpty && x1 > x0)
        {
            switch(solutionMethod)
            {
                case .Chord:
                var xPrev: Double = x0;
                var xCurr: Double = x1;
                var xMid: Double;
                var xNext: Double = 0;
                
                repeat
                {
                    xMid = xNext;
                    xNext = xCurr - (try! f.evaluate(["x": xCurr])) * (xPrev - xCurr) / ((try! f.evaluate(["x": xPrev])) - (try! f.evaluate(["x": xCurr])));
                    xPrev = xCurr;
                    xCurr = xMid;
                }
                while(abs(xNext - xCurr) > e)
                        
                return xNext;
                
                case .Dichotomy:
                var left: Double = x0;
                var right: Double = x1;
                var y, x: Double;
                
                repeat
                {
                    x = (left + right) / 2;
                    y = try! f.evaluate(["x": x]);
                    
                    if (y > 0)
                    {
                        right = x;
                    }
                    else
                    {
                        left = x;
                    }
                }
                while(abs(y) > e)
                        
                return x;
            }
                                
        }
        
        return 0;
    }
}

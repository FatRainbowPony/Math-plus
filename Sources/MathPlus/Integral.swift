import Foundation
import MathParser

public class Integral
{
    public enum SolutionMethod
    {
        case LeftRectangle
        case RightRectangle
        case Trapeze
    }
    
    public var f: String;
    public var a: Double;
    public var b: Double;
      
    public init()
    {
        f = "";
        a = 0;
        b = 0;
    }
    
    public init(_f: String, _a: Double, _b: Double)
    {
        f = _f;
        a = _a;
        b = _b;
    }
    
    ///Solves the integral
    ///- Parameters:
    ///     - solutionMethod: Integral solution method
    ///     - n: Number of points
    ///- Returns:Numerical value of the integral
    public func solve(solutionMethod: SolutionMethod, n: Int32) -> Double
    {
        var y, result: Double;
        var i: Int32;
        
        if (!f.isEmpty && b > a && n > 0)
        {
            let h = (b - a)/Double(n);
            
            switch(solutionMethod)
            {
                case .LeftRectangle:
                y = 0;
                result = 0;
                i = 0;
                
                while (i <= n - 1)
                {
                    y = try! f.evaluate(["x": a + Double(i) * h]);
                    result += h * y;
                    i += 1;
                }
                
                case .RightRectangle:
                y = 0;
                result = 0;
                i = 1;
                
                while (i <= n)
                {
                    y = try! f.evaluate(["x": a + Double(i) * h]);
                    result += h * y;
                    i += 1;
                }
                
                case .Trapeze:
                y = 0;
                result = try! f.evaluate(["x": a]) + f.evaluate(["x": b]);
                i = 1;
                
                while (i <= n - 1)
                {
                    y = try! f.evaluate(["x": a + Double(i) * h]);
                    result += 2 * y;
                    i += 1;
                }
                
                result *= h / 2;
            }
            
            return result;
        }
        
        return 0;
    }
}

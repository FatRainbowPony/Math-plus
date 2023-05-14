import Foundation
import XCTest
import MathPlus

public class IntegralTests: XCTestCase
{
    func integralSolutionTest()
    {
        let integral = Integral(_f: "$x**2", _a: 1, _b: 2);
        
        do
        {
            try integral.solve(solutionMethod: Integral.SolutionMethod.LeftRectangle, n: 10)
        }
        catch
        {
            XCTFail("Error in solving a integral");
        }
    }
}

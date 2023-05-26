import Foundation
import XCTest
import MathPlus

public class NonlinearFuncTests: XCTestCase
{
    func nonlinearFuncSolutionTest()
    {
        let nonlinearFunc = NonlinearFunc(_f: "$x**2")
        
        do
        {
            try nonlinearFunc.solve(x: 7, e: 0.001);
        }
        catch
        {
            XCTFail("Error in solving a nonlinear function");
        }
        
        do
        {
            try nonlinearFunc.solve(solutionMethod: NonlinearFunc.SolutionMethod.Chord, x0: 1, x1: 2, e: 0.001);
        }
        catch
        {
            XCTFail("Error in solving a nonlinear function");
        }
    }
}

import Foundation

public class Number
{
    ///Sets the number to the specified number of decimal places
    ///- Parameters:
    ///     - number: Original number
    ///     - digits: Number of decimal places
    ///- Returns: New rounded number
    public static func round(number: Double, digits: Int32) -> Double
    {
        if (digits >= 0)
        {
            let multiplier = pow(10, Double(digits));
            let newNumber = Foundation.round(multiplier * number) / multiplier;
            
            return newNumber;
        }
        
        return number;
    }
}

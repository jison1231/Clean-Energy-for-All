Public Class CleanEnergyForAll

'Declare Variables
Dim energySource As String
Dim electricityUsage As Double
Dim energyEfficiency As Double
Dim totalRenewable As Double

'Prompt user to enter energy source
Console.WriteLine("Please enter the primary energy source you would like to use:")
energySource = Console.ReadLine()

'Prompt user to enter electricity usage
Console.WriteLine("Please enter the amount of electricity you would like to use:")
electricityUsage = Console.ReadLine()

'Calculate energy efficiency
energyEfficiency = electricityUsage / energySource

'Calculate total renewable
totalRenewable = electricityUsage - (electricityUsage * energyEfficiency)

'Display results
Console.WriteLine("The total renewable energy you would be using is: " & totalRenewable & " kWh")

'Loop through to calculate energy savings
Dim energySavings as Double
For i As Integer = 1 To 12
	energySavings = totalRenewable - (totalRenewable * (i/12))
	Console.WriteLine("The energy savings for month " & i & " would be " & energySavings & " kWh")
Next

End Class
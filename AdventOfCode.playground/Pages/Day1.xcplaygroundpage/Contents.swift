import Foundation

let filePath = Bundle.main.path(forResource:"input", ofType: "txt")
let contentData = FileManager.default.contents(atPath: filePath!)
let input = try! JSONSerialization.jsonObject(with: contentData!, options: []) as! [Int]

print("-------------------Part 1-------------------")

outerLoop: for numberOne in input {
	for numberTwo in input {
		if numberOne + numberTwo == 2020 {
			print("First: \(numberOne), Second: \(numberTwo), Multiply: \(numberOne*numberTwo)")
			break outerLoop
		}
	}
}

print("-------------------Part 2-------------------")

outerLoop: for numberOne in input {
	for numberTwo in input {
		for numberThree in input {
			if numberOne + numberTwo + numberThree == 2020 {
				print("First: \(numberOne), Second: \(numberTwo), Third: \(numberThree) , Multiply: \(numberOne*numberTwo*numberThree)")
				break outerLoop
			}
		}
	}
}

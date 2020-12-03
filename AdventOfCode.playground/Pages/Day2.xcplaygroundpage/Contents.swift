import Foundation

struct Policy: Codable, CustomStringConvertible {
	let lower: Int
	let upper: Int
	let character: String
	let password: String

	init?(json: [String: Any]) {
		print(json)
		guard let lower = json["lower"] as? Int, let upper = json["upper"] as? Int, let character = json["character"] as? String, let password = json["password"] as? String else {
			return nil
		}

		self.lower = lower
		self.upper = upper
		self.character = character
		self.password = password
	}

	func isValid() -> Bool {
		let charactersArray = Array(password)
		let occurance = charactersArray.filter { (char) -> Bool in
			if char == Character(character) {
				return true
			}
			return false
		}.count

		if (lower...upper).contains(occurance) {
			return true
		}
		return false
	}

	var description: String {
		return "\nLower: \(lower), Upper:\(upper), Character: \(character), Password:\(password)"
	}
}

let filePath = Bundle.main.path(forResource:"input", ofType: "txt")
let contentData = FileManager.default.contents(atPath: filePath!)
let input = try! JSONDecoder().decode([Policy].self, from: contentData!)

print("-------------------Part 1-------------------")

let result = input.map { Policy -> Bool in
	return Policy.isValid()
}.filter{ $0 == true }.count

print("Valid Passwords: \(result)")



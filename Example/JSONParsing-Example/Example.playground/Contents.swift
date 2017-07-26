//: Playground - noun: a place where people can play

import UIKit
import JSONParsing

enum Test: String, JSONParseRawRepresentable {
	typealias RawValue = String
	case one = "one"
	case two = "two"
	case three
}

let jsonData = "{\"data\": [\"one\",\"two\"]}"
let data = jsonData.data(using: .utf8)!
let json = JSON(data: data)
struct Object: JSONParseable {
	
	let values: [Test]
	
	static func parse(_ json: JSON) throws -> Object {
		return try Object(values: json["data"]^^)
	}
	
}

do {
	let object = try Object.parse(json)
	print(object.values)
} catch {
	print(error)
}
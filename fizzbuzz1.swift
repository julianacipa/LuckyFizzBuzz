#!/usr/bin/swift

let fizzString: String = "fizz"
let buzzString: String = "buzz"

func fizz(_ n: Int) -> Bool {
    return n % 3 == 0
}

func buzz(_ n: Int) -> Bool {
    return n % 5 == 0
}

func fizzbuzz(_ n: Int) -> String {
    switch (fizz(n), buzz(n)) {
    case (true, false):
        return fizzString
    case (false, true):
        return buzzString
    case (true, true):
        return fizzString + buzzString
    default:
        return String(n)
    }
}

func fizzbuzz(_ range: ClosedRange<Int>) -> String {
    var resultString = ""

    for value in range {
        resultString += (fizzbuzz(value) + " ")
    }

    return resultString
}

let oneToTwentyFizzbuzz = fizzbuzz(1...20)
let expectedResultForOneToTwentyFizzBuzz = "1 2 fizz 4 buzz fizz 7 8 fizz buzz 11 fizz 13 14 fizzbuzz 16 17 fizz 19 buzz "

print((oneToTwentyFizzbuzz == expectedResultForOneToTwentyFizzBuzz) ? "correct result:" : "incorrect result:")
print(oneToTwentyFizzbuzz)

#!/usr/bin/swift

let fizzString: String = "fizz"
let buzzString: String = "buzz"
let luckyString: String = "lucky"

func isMultiplesOfThree(_ n: Int) -> Bool {
    return n % 3 == 0
}

func isMultiplesOfFive(_ n: Int) -> Bool {
    return n % 5 == 0
}

func containsNumberThree(_ n: Int) -> Bool {
    return String(n).contains("3")
}

func fizzbuzz(_ n: Int) -> String {
    switch (isMultiplesOfThree(n), isMultiplesOfFive(n)) {
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

func luckyFizzBuzz(_ n: Int) -> String {
    if containsNumberThree(n) {
        return luckyString
    } else {
        return fizzbuzz(n)
    }
}

func luckyfizzbuzz(_ range: ClosedRange<Int>) -> String {

    var resultString = ""

    for value in range {
        resultString += (luckyFizzBuzz(value) + " ")
    }

    return resultString
}

let oneToTwentyLuckyFizzbuzz = luckyfizzbuzz(1...20)
let expectedResultForOneToTwentyLuckyFizzBuzz = "1 2 lucky 4 buzz fizz 7 8 fizz buzz 11 fizz lucky 14 fizzbuzz 16 17 fizz 19 buzz "

print((oneToTwentyLuckyFizzbuzz == expectedResultForOneToTwentyLuckyFizzBuzz) ? "correct result:" : "incorrect result:")
print(oneToTwentyLuckyFizzbuzz)


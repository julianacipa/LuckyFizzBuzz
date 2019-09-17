#!/usr/bin/swift

let fizzString: String = "fizz"
let buzzString: String = "buzz"
let fizzbuzzString: String = "fizzbuzz"
let luckyString: String = "lucky"

enum IntegerToStringConvertionType: CaseIterable {
    case FizzConvertion
    case BuzzConvertion
    case FizzBuzzConvertion
    case LuckyConvertion
    case AsIsConvertion
}

struct LuckyFizzBuzzDetails {
    let originalNumber: Int
    let conversionType: IntegerToStringConvertionType
    let correspondingString: String
}

func luckyFizzBuzz(_ n: Int) -> IntegerToStringConvertionType {
    switch n {
    case n where String(n).contains("3"):
        return .LuckyConvertion
    case n where n % 15 == 0:
        return .FizzBuzzConvertion
    case n where n % 5 == 0:
        return .BuzzConvertion
    case n where n % 3 == 0:
        return .FizzConvertion
    default:
        return .AsIsConvertion
    }
}

func luckyFizzBuzz(_ n:Int, withConversionType conversionType: IntegerToStringConvertionType) -> String {
    switch conversionType {
    case .LuckyConvertion:
        return luckyString
    case .FizzBuzzConvertion:
        return fizzbuzzString
    case .BuzzConvertion:
        return buzzString
    case .FizzConvertion:
        return fizzString
    case .AsIsConvertion:
        return String(n)
    }
}

func luckyFizzBuzz(_ range: ClosedRange<Int>) -> Array<LuckyFizzBuzzDetails> {
    var resultsArray: Array<LuckyFizzBuzzDetails> = []

    for (index, value) in range.enumerated() {
        let conversionType = luckyFizzBuzz(value)
        let luckyFizzBuzzString = luckyFizzBuzz(value, withConversionType: conversionType)
        let luckyFizzBuzzDetails = LuckyFizzBuzzDetails(originalNumber: value, conversionType: conversionType, correspondingString: luckyFizzBuzzString)

        resultsArray.insert(luckyFizzBuzzDetails, at: index)
    }

    return resultsArray
}

func luckyFizzBuzzConversion(_ details: Array<LuckyFizzBuzzDetails>) -> String {
    return details.map{$0.correspondingString}.joined(separator:" ")
}

func luckyFizzBuzzCounter(_ details: Array<LuckyFizzBuzzDetails>, withType type: IntegerToStringConvertionType) -> String {
    return String(details.filter{$0.conversionType == type}.count)
}

func luckyFizzBuzzConversionReport(_ details: Array<LuckyFizzBuzzDetails>) -> String {
    var fizzCounter =  fizzString + ": "
    var buzzCounter = buzzString + ": "
    var fizzbuzzCounter = fizzbuzzString + ": "
    var luckyCounter = luckyString + ": "
    var integerCounter =  "integer: "

    for type in IntegerToStringConvertionType.allCases {
        switch type {
        case .FizzConvertion:
            fizzCounter += luckyFizzBuzzCounter(details, withType: type)
        case .BuzzConvertion:
            buzzCounter += luckyFizzBuzzCounter(details, withType: type)
        case .FizzBuzzConvertion:
            fizzbuzzCounter += luckyFizzBuzzCounter(details, withType: type)
        case .LuckyConvertion:
            luckyCounter += luckyFizzBuzzCounter(details, withType: type)
        case .AsIsConvertion:
            integerCounter += luckyFizzBuzzCounter(details, withType: type)
        }
    }

    return fizzCounter + " " + buzzCounter + " "  + fizzbuzzCounter + " "  + luckyCounter + " " + integerCounter
}

func luckyFizzBuzzReport(_ range: ClosedRange<Int>) -> String {
    let luckyFizzBuzzDetails: Array<LuckyFizzBuzzDetails> = luckyFizzBuzz(range)
    let resultString = luckyFizzBuzzConversion(luckyFizzBuzzDetails)
    let resultsReport = luckyFizzBuzzConversionReport(luckyFizzBuzzDetails)

    return resultString + " " + resultsReport
}

// TESTS

let oneToTwentyLuckyFizzBuzzWithReport = luckyFizzBuzzReport(1...20)
let expectedResultForOneToTwentyLuckyFizzBuzzWithReport = "1 2 lucky 4 buzz fizz 7 8 fizz buzz 11 fizz lucky 14 fizzbuzz 16 17 fizz 19 buzz fizz: 4 buzz: 3 fizzbuzz: 1 lucky: 2 integer: 10"

print((oneToTwentyLuckyFizzBuzzWithReport == expectedResultForOneToTwentyLuckyFizzBuzzWithReport) ? "correct result:" : "incorrect result:")
print(oneToTwentyLuckyFizzBuzzWithReport)

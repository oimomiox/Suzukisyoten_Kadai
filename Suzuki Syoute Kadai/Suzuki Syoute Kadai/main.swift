
import Foundation

var iNumber = 0 // 行の番号
var jNumber = 0 // 列の番号
var nNumber = 0 // 選ばれた言葉の番号

var bingoiNumber: [Int] = [] // ビンゴカードの当たった単語の行数の配列
var bingojNumber: [Int] = [] // ビンゴカードの当たった単語の列数の配列


// 標準入力からそれぞれデータを取得↓

let s = Int(readLine()!)! // sの値を標準入力から取得、iとjのMAX数
var iLineWord: [String] = [String]() // 行列ごとの配列

for _ in 0..<s {
    iLineWord.append(readLine()!) // sの値の分、標準入力を取得
}

let n = Int(readLine()!)! // nの値を標準入力から取得、入力した単語の数

var word = [String]() // 入力した単語の配列
for _ in 0..<n {
    word.append(readLine()!) // nの値の分、標準入力を取得
}



func bingoWord(iNumber: Int, jNumber: Int) -> String {
    String(iLineWord[iNumber].split(separator: " ")[jNumber]) // ビンゴカードの単語
}

// ビンゴで当たった単語のi（行）、j（列）の配列を作る↓
for nNumber in 0..<n {
    for iNumber in 0..<s {
        for jNumber in 0..<s {
            if word[nNumber] == bingoWord(iNumber: iNumber, jNumber: jNumber) {
                bingoiNumber.append(iNumber)
                bingojNumber.append(jNumber)
            }
        }
    }
}


// 縦のビンゴ判定の処理↓

var iLineBingo = false // 縦ビンゴ判定

for i in 0..<s {
    var count = 0
    for num in bingoiNumber {
        if i == num {
            count += 1
        }
    }
    if count == s {
        iLineBingo = true
    }
}

// 横のビンゴ判定の処理↓

var jLineBingo = false // 横ビンゴ判定

for i in 0..<s {
    var count = 0
    for num in bingojNumber {
        if i == num {
            count += 1
        }
    }
    if count == s {
        jLineBingo = true
    }
}

// 斜めのビンゴ判定の処理↓

var sameijCount = 0 // 行、列が同じ番号のビンゴの数
var ijCount = 0 // 行、列の合計がマス数マイナス１の数

for i in 0..<bingoiNumber.count {
    if bingoiNumber[i] == bingojNumber[i] {
        sameijCount += 1
    }
    if bingoiNumber[i] + bingojNumber[i] == s - 1 {
        ijCount += 1
    }
}


// 結果出力↓

if sameijCount == s {
    print("yes")
} else if ijCount == s {
    print("yes")
} else if iLineBingo == true {
    print("yes")
} else if jLineBingo == true {
    print("yes")
} else {
    print("no")
}

print(bingoiNumber)
print(bingojNumber)
print(ijCount)

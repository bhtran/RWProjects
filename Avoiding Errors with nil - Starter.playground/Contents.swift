/**
 * Copyright (c) 2016 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

// ----------------------------------------------------------------------------
// Playground that includes Witches.
//
// These magical beings may be created and may cast spells on each other 
// & their familiars (i.e. cats, bats, toads).
// ----------------------------------------------------------------------------

protocol Avatar {
  var avatar: String { get }
}


// ----------------------------------------------------------------------------
// Example One - Avoiding Swift errors using nil (failable initializers)
// ----------------------------------------------------------------------------

enum MagicWords: String {
  case abracadbra = "abracadabra"
  case alakazam = "alakazam"
  case hocusPocus = "hocus pocus"
  case prestoChango = "presto chango"
}

struct Spell {
  var magicWords: MagicWords = .abracadbra
}

// MARK: Factory-Made method in case something doesn't exist. Could be cleaned up using a failable initializer
//extension Spell {
//  static func create(withMagicWords words: String) -> Spell? {
//    if let incantation = MagicWords(rawValue: words) {
//      var spell = Spell()
//      spell.magicWords = incantation
//      return spell
//    }
//    else {
//      return nil
//    }
//  }
//}

// MARK: Failable initializer that cleans up the create(withMagicWords)
//extension Spell {
//    init?(words: String) {
//        if let incantation = MagicWords(rawValue: words) {
//            self.magicWords = incantation
//        }
//        else {
//            return nil
//        }
//    }
//}

// MARK: Cleaned up even more with a early exit guard statement. No need for the else clause.
extension Spell {
    init?(words: String) {
        guard let incantation = MagicWords(rawValue: words) else {
            return nil
        }
        self.magicWords = incantation
    }
}

let first = Spell(words: "abracadabra")
let second = Spell(words: "ascendio")
    

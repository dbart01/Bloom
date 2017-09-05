//
//  Fragment+ColorTests.swift
//  BloomTests
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import XCTest
@testable import Bloom

class Fragment_ColorTests: XCTestCase {
    
    // ----------------------------------
    //  MARK: - Background Colors -
    //
    func testTextColorsWithFragment() {
        let content  = "Something went wrong."
        
        self.testColorsWithFragment(content: content, test: { _ = $0.defaultText      }, expectation: "\u{1B}[39m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.blackText        }, expectation: "\u{1B}[30m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.redText          }, expectation: "\u{1B}[31m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.greenText        }, expectation: "\u{1B}[32m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.yellowText       }, expectation: "\u{1B}[33m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.blueText         }, expectation: "\u{1B}[34m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.magentaText      }, expectation: "\u{1B}[35m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.cyanText         }, expectation: "\u{1B}[36m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightGrayText    }, expectation: "\u{1B}[37m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.darkGrayText     }, expectation: "\u{1B}[90m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightRedText     }, expectation: "\u{1B}[91m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightGreenText   }, expectation: "\u{1B}[92m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightYellowText  }, expectation: "\u{1B}[93m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightBlueText    }, expectation: "\u{1B}[94m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightMagentaText }, expectation: "\u{1B}[95m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightCyanText    }, expectation: "\u{1B}[96m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.whiteText        }, expectation: "\u{1B}[97m\(content)\u{1B}[0m")
    }
    
    func testTextColorsWithString() {
        let content  = "Something went wrong."
        
        self.testColorsWithString(content: content, test: { return $0.defaultText      }, expectation: "\u{1B}[39m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.blackText        }, expectation: "\u{1B}[30m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.redText          }, expectation: "\u{1B}[31m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.greenText        }, expectation: "\u{1B}[32m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.yellowText       }, expectation: "\u{1B}[33m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.blueText         }, expectation: "\u{1B}[34m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.magentaText      }, expectation: "\u{1B}[35m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.cyanText         }, expectation: "\u{1B}[36m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightGrayText    }, expectation: "\u{1B}[37m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.darkGrayText     }, expectation: "\u{1B}[90m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightRedText     }, expectation: "\u{1B}[91m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightGreenText   }, expectation: "\u{1B}[92m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightYellowText  }, expectation: "\u{1B}[93m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightBlueText    }, expectation: "\u{1B}[94m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightMagentaText }, expectation: "\u{1B}[95m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightCyanText    }, expectation: "\u{1B}[96m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.whiteText        }, expectation: "\u{1B}[97m\(content)\u{1B}[0m")
    }
    
    // ----------------------------------
    //  MARK: - Background Colors -
    //
    func testBackgroundColorsWithFragment() {
        let content  = "Wow!"
        
        self.testColorsWithFragment(content: content, test: { _ = $0.defaultBackground      }, expectation: "\u{1B}[49m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.blackBackground        }, expectation: "\u{1B}[40m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.redBackground          }, expectation: "\u{1B}[41m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.greenBackground        }, expectation: "\u{1B}[42m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.yellowBackground       }, expectation: "\u{1B}[43m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.blueBackground         }, expectation: "\u{1B}[44m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.magentaBackground      }, expectation: "\u{1B}[45m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.cyanBackground         }, expectation: "\u{1B}[46m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightGrayBackground    }, expectation: "\u{1B}[47m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.darkGrayBackground     }, expectation: "\u{1B}[100m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightRedBackground     }, expectation: "\u{1B}[101m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightGreenBackground   }, expectation: "\u{1B}[102m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightYellowBackground  }, expectation: "\u{1B}[103m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightBlueBackground    }, expectation: "\u{1B}[104m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightMagentaBackground }, expectation: "\u{1B}[105m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.lightCyanBackground    }, expectation: "\u{1B}[106m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.whiteBackground        }, expectation: "\u{1B}[107m\(content)\u{1B}[0m")
    }
    
    func testBackgroundColorsWithString() {
        let content  = "Wow!"
        
        self.testColorsWithString(content: content, test: { return $0.defaultBackground      }, expectation: "\u{1B}[49m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.blackBackground        }, expectation: "\u{1B}[40m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.redBackground          }, expectation: "\u{1B}[41m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.greenBackground        }, expectation: "\u{1B}[42m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.yellowBackground       }, expectation: "\u{1B}[43m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.blueBackground         }, expectation: "\u{1B}[44m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.magentaBackground      }, expectation: "\u{1B}[45m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.cyanBackground         }, expectation: "\u{1B}[46m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightGrayBackground    }, expectation: "\u{1B}[47m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.darkGrayBackground     }, expectation: "\u{1B}[100m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightRedBackground     }, expectation: "\u{1B}[101m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightGreenBackground   }, expectation: "\u{1B}[102m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightYellowBackground  }, expectation: "\u{1B}[103m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightBlueBackground    }, expectation: "\u{1B}[104m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightMagentaBackground }, expectation: "\u{1B}[105m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.lightCyanBackground    }, expectation: "\u{1B}[106m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.whiteBackground        }, expectation: "\u{1B}[107m\(content)\u{1B}[0m")
    }
    
    // ----------------------------------
    //  MARK: - Styles -
    //
    func testStylesWithFragment() {
        let content  = "Cool."
        
        self.testColorsWithFragment(content: content, test: { _ = $0.bold       }, expectation: "\u{1B}[1m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.dimmed     }, expectation: "\u{1B}[2m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.underlined }, expectation: "\u{1B}[4m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.blinking   }, expectation: "\u{1B}[5m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.inverted   }, expectation: "\u{1B}[7m\(content)\u{1B}[0m")
        self.testColorsWithFragment(content: content, test: { _ = $0.hidden     }, expectation: "\u{1B}[8m\(content)\u{1B}[0m")
    }
    
    func testStylesWithString() {
        let content  = "Cool."
        
        self.testColorsWithString(content: content, test: { return $0.bold       }, expectation: "\u{1B}[1m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.dimmed     }, expectation: "\u{1B}[2m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.underlined }, expectation: "\u{1B}[4m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.blinking   }, expectation: "\u{1B}[5m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.inverted   }, expectation: "\u{1B}[7m\(content)\u{1B}[0m")
        self.testColorsWithString(content: content, test: { return $0.hidden     }, expectation: "\u{1B}[8m\(content)\u{1B}[0m")
    }
    
    // ----------------------------------
    //  MARK: - Utilities -
    //
    private func testColorsWithFragment(content: String, test: (Fragment) -> Void, expectation: String) {
        let fragment = Fragment(content)
        test(fragment)
        XCTAssertEqual("\(fragment)", expectation)
    }
    
    private func testColorsWithString(content: String, test: (String) -> Fragment, expectation: String) {
        let fragment = test(content)
        XCTAssertEqual("\(fragment)", expectation)
    }
}

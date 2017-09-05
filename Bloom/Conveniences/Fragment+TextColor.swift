//
//  Fragment+TextColor.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension Fragment {
    
    var defaultText: Fragment {
        self.attributes.textColor = TextColor.default
        return self
    }
    
    var blackText: Fragment {
        self.attributes.textColor = TextColor.black
        return self
    }
    
    var redText: Fragment {
        self.attributes.textColor = TextColor.red
        return self
    }
    
    var greenText: Fragment {
        self.attributes.textColor = TextColor.green
        return self
    }
    
    var yellowText: Fragment {
        self.attributes.textColor = TextColor.yellow
        return self
    }
    
    var blueText: Fragment {
        self.attributes.textColor = TextColor.blue
        return self
    }
    
    var magentaText: Fragment {
        self.attributes.textColor = TextColor.magenta
        return self
    }
    
    var cyanText: Fragment {
        self.attributes.textColor = TextColor.cyan
        return self
    }
    
    var lightGrayText: Fragment {
        self.attributes.textColor = TextColor.lightGray
        return self
    }
    
    var darkGrayText: Fragment {
        self.attributes.textColor = TextColor.darkGray
        return self
    }
    
    var lightRedText: Fragment {
        self.attributes.textColor = TextColor.lightRed
        return self
    }
    
    var lightGreenText: Fragment {
        self.attributes.textColor = TextColor.lightGreen
        return self
    }
    
    var lightYellowText: Fragment {
        self.attributes.textColor = TextColor.lightYellow
        return self
    }
    
    var lightBlueText: Fragment {
        self.attributes.textColor = TextColor.lightBlue
        return self
    }
    
    var lightMagentaText: Fragment {
        self.attributes.textColor = TextColor.lightMagenta
        return self
    }
    
    var lightCyanText: Fragment {
        self.attributes.textColor = TextColor.lightCyan
        return self
    }
    
    var whiteText: Fragment {
        self.attributes.textColor = TextColor.white
        return self
    }
}

extension String {
    
    var defaultText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.default
        return Fragment(self, attributeCollection: attributes)
    }
    
    var blackText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.black
        return Fragment(self, attributeCollection: attributes)
    }
    
    var redText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.red
        return Fragment(self, attributeCollection: attributes)
    }
    
    var greenText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.green
        return Fragment(self, attributeCollection: attributes)
    }
    
    var yellowText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.yellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    var blueText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.blue
        return Fragment(self, attributeCollection: attributes)
    }
    
    var magentaText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.magenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    var cyanText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.cyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightGrayText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    var darkGrayText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.darkGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightRedText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightRed
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightGreenText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightGreen
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightYellowText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightYellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightBlueText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightBlue
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightMagentaText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightMagenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightCyanText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightCyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    var whiteText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.white
        return Fragment(self, attributeCollection: attributes)
    }
}

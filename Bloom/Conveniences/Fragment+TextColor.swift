//
//  Fragment+TextColor.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension Fragment {
    
    public var defaultText: Fragment {
        self.attributes.textColor = TextColor.default
        return self
    }
    
    public var blackText: Fragment {
        self.attributes.textColor = TextColor.black
        return self
    }
    
    public var redText: Fragment {
        self.attributes.textColor = TextColor.red
        return self
    }
    
    public var greenText: Fragment {
        self.attributes.textColor = TextColor.green
        return self
    }
    
    public var yellowText: Fragment {
        self.attributes.textColor = TextColor.yellow
        return self
    }
    
    public var blueText: Fragment {
        self.attributes.textColor = TextColor.blue
        return self
    }
    
    public var magentaText: Fragment {
        self.attributes.textColor = TextColor.magenta
        return self
    }
    
    public var cyanText: Fragment {
        self.attributes.textColor = TextColor.cyan
        return self
    }
    
    public var lightGrayText: Fragment {
        self.attributes.textColor = TextColor.lightGray
        return self
    }
    
    public var darkGrayText: Fragment {
        self.attributes.textColor = TextColor.darkGray
        return self
    }
    
    public var lightRedText: Fragment {
        self.attributes.textColor = TextColor.lightRed
        return self
    }
    
    public var lightGreenText: Fragment {
        self.attributes.textColor = TextColor.lightGreen
        return self
    }
    
    public var lightYellowText: Fragment {
        self.attributes.textColor = TextColor.lightYellow
        return self
    }
    
    public var lightBlueText: Fragment {
        self.attributes.textColor = TextColor.lightBlue
        return self
    }
    
    public var lightMagentaText: Fragment {
        self.attributes.textColor = TextColor.lightMagenta
        return self
    }
    
    public var lightCyanText: Fragment {
        self.attributes.textColor = TextColor.lightCyan
        return self
    }
    
    public var whiteText: Fragment {
        self.attributes.textColor = TextColor.white
        return self
    }
}

extension String {
    
    public var defaultText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.default
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var blackText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.black
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var redText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.red
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var greenText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.green
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var yellowText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.yellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var blueText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.blue
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var magentaText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.magenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var cyanText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.cyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightGrayText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var darkGrayText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.darkGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightRedText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightRed
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightGreenText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightGreen
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightYellowText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightYellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightBlueText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightBlue
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightMagentaText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightMagenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightCyanText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.lightCyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var whiteText: Fragment {
        var attributes       = AttributeCollection()
        attributes.textColor = TextColor.white
        return Fragment(self, attributeCollection: attributes)
    }
}

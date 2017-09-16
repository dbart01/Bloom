//
//  Fragment+TextColor.swift
//  Bloom
//
//  The MIT License (MIT)
//
//  Copyright (c) 2017 Dima Bart
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
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

//
//  Fragment+BackgroundColor.swift
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
    
    public var defaultBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.default
        return self
    }
    
    public var blackBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.black
        return self
    }
    
    public var redBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.red
        return self
    }
    
    public var greenBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.green
        return self
    }
    
    public var yellowBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.yellow
        return self
    }
    
    public var blueBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.blue
        return self
    }
    
    public var magentaBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.magenta
        return self
    }
    
    public var cyanBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.cyan
        return self
    }
    
    public var lightGrayBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightGray
        return self
    }
    
    public var darkGrayBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.darkGray
        return self
    }
    
    public var lightRedBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightRed
        return self
    }
    
    public var lightGreenBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightGreen
        return self
    }
    
    public var lightYellowBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightYellow
        return self
    }
    
    public var lightBlueBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightBlue
        return self
    }
    
    public var lightMagentaBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightMagenta
        return self
    }
    
    public var lightCyanBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightCyan
        return self
    }
    
    public var whiteBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.white
        return self
    }
}

extension String {
    
    public var defaultBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.default
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var blackBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.black
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var redBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.red
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var greenBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.green
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var yellowBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.yellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var blueBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.blue
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var magentaBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.magenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var cyanBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.cyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightGrayBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var darkGrayBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.darkGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightRedBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightRed
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightGreenBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightGreen
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightYellowBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightYellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightBlueBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightBlue
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightMagentaBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightMagenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var lightCyanBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightCyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var whiteBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.white
        return Fragment(self, attributeCollection: attributes)
    }
}

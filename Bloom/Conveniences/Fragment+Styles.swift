//
//  Fragment+Styles.swift
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
    
    public var bold: Fragment {
        self.attributes.styleAttributes.insert(Style.bold)
        return self
    }
    
    public var dimmed: Fragment {
        self.attributes.styleAttributes.insert(Style.dimmed)
        return self
    }
    
    public var underlined: Fragment {
        self.attributes.styleAttributes.insert(Style.underlined)
        return self
    }
    
    public var blinking: Fragment {
        self.attributes.styleAttributes.insert(Style.blinking)
        return self
    }
    
    public var inverted: Fragment {
        self.attributes.styleAttributes.insert(Style.inverted)
        return self
    }
    
    public var hidden: Fragment {
        self.attributes.styleAttributes.insert(Style.hidden)
        return self
    }
}

extension String {
    
    public var bold: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.bold)
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var dimmed: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.dimmed)
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var underlined: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.underlined)
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var blinking: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.blinking)
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var inverted: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.inverted)
        return Fragment(self, attributeCollection: attributes)
    }
    
    public var hidden: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.hidden)
        return Fragment(self, attributeCollection: attributes)
    }
}

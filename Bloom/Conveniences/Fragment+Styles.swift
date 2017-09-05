//
//  Fragment+Styles.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
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

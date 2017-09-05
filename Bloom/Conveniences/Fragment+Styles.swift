//
//  Fragment+Styles.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension Fragment {
    
    var bold: Fragment {
        self.attributes.styleAttributes.insert(Style.bold)
        return self
    }
    
    var dimmed: Fragment {
        self.attributes.styleAttributes.insert(Style.dimmed)
        return self
    }
    
    var underlined: Fragment {
        self.attributes.styleAttributes.insert(Style.underlined)
        return self
    }
    
    var blinking: Fragment {
        self.attributes.styleAttributes.insert(Style.blinking)
        return self
    }
    
    var inverted: Fragment {
        self.attributes.styleAttributes.insert(Style.inverted)
        return self
    }
    
    var hidden: Fragment {
        self.attributes.styleAttributes.insert(Style.hidden)
        return self
    }
}

extension String {
    
    var bold: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.bold)
        return Fragment(self, attributeCollection: attributes)
    }
    
    var dimmed: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.dimmed)
        return Fragment(self, attributeCollection: attributes)
    }
    
    var underlined: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.underlined)
        return Fragment(self, attributeCollection: attributes)
    }
    
    var blinking: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.blinking)
        return Fragment(self, attributeCollection: attributes)
    }
    
    var inverted: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.inverted)
        return Fragment(self, attributeCollection: attributes)
    }
    
    var hidden: Fragment {
        var attributes = AttributeCollection()
        attributes.styleAttributes.insert(Style.hidden)
        return Fragment(self, attributeCollection: attributes)
    }
}

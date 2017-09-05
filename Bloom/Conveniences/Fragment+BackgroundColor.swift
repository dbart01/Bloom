//
//  Fragment+BackgroundColor.swift
//  Bloom
//
//  Created by Dima Bart on 2017-09-04.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Foundation

extension Fragment {
    
    var defaultBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.default
        return self
    }
    
    var blackBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.black
        return self
    }
    
    var redBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.red
        return self
    }
    
    var greenBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.green
        return self
    }
    
    var yellowBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.yellow
        return self
    }
    
    var blueBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.blue
        return self
    }
    
    var magentaBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.magenta
        return self
    }
    
    var cyanBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.cyan
        return self
    }
    
    var lightGrayBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightGray
        return self
    }
    
    var darkGrayBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.darkGray
        return self
    }
    
    var lightRedBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightRed
        return self
    }
    
    var lightGreenBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightGreen
        return self
    }
    
    var lightYellowBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightYellow
        return self
    }
    
    var lightBlueBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightBlue
        return self
    }
    
    var lightMagentaBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightMagenta
        return self
    }
    
    var lightCyanBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.lightCyan
        return self
    }
    
    var whiteBackground: Fragment {
        self.attributes.backgroundColor = BackgroundColor.white
        return self
    }
}

extension String {
    
    var defaultBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.default
        return Fragment(self, attributeCollection: attributes)
    }
    
    var blackBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.black
        return Fragment(self, attributeCollection: attributes)
    }
    
    var redBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.red
        return Fragment(self, attributeCollection: attributes)
    }
    
    var greenBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.green
        return Fragment(self, attributeCollection: attributes)
    }
    
    var yellowBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.yellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    var blueBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.blue
        return Fragment(self, attributeCollection: attributes)
    }
    
    var magentaBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.magenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    var cyanBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.cyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightGrayBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    var darkGrayBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.darkGray
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightRedBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightRed
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightGreenBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightGreen
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightYellowBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightYellow
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightBlueBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightBlue
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightMagentaBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightMagenta
        return Fragment(self, attributeCollection: attributes)
    }
    
    var lightCyanBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.lightCyan
        return Fragment(self, attributeCollection: attributes)
    }
    
    var whiteBackground: Fragment {
        var attributes             = AttributeCollection()
        attributes.backgroundColor = BackgroundColor.white
        return Fragment(self, attributeCollection: attributes)
    }
}

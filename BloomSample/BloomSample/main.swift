//
//  main.swift
//  BloomSample
//
//  Created by Dima Bart on 2017-09-05.
//  Copyright © 2017 Dima Bart. All rights reserved.
//

import Bloom

print("Building...".blinking.bold.blueText)
print("Something went wrong".redBackground)
print("Complete".yellowText)
print("Something went " + "wrong".redBackground.underlined + " when trying to build.".bold.dimmed)
print("Build succeeded.".greenBackground.blinking.inverted + " Attemping to build something else.".inverted)

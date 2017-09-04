//
//  GCDBlackBox.swift
//  OnTheMapV.2
//
//  Created by Benjamin Odisho on 9/3/17.
//  Copyright © 2017 Benjamin Odisho. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}

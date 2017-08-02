/*
 *   Copyright © 2017 Teclib. All rights reserved.
 *
 * LocalStorage.swift is part of flyve-mdm-ios
 *
 * flyve-mdm-ios is a subproject of Flyve MDM. Flyve MDM is a mobile
 * device management software.
 *
 * flyve-mdm-ios is free software: you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version.
 *
 * flyve-mdm-ios is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * ------------------------------------------------------------------------------
 * @author    Hector Rondon
 * @date      13/07/17
 * @copyright   Copyright © 2017 Teclib. All rights reserved.
 * @license   GPLv3 https://www.gnu.org/licenses/gpl-3.0.html
 * @link      https://github.com/flyve-mdm/flyve-mdm-ios
 * @link      https://flyve-mdm.com
 * ------------------------------------------------------------------------------
 */

import Foundation

public func getStorage(key: String) -> AnyObject? {

    if let obj = UserDefaults.standard.object(forKey: key) {
        return NSKeyedUnarchiver.unarchiveObject(with: obj as? Data ?? Data()) as AnyObject

    } else {
        return nil
    }
}

public func setStorage(value: AnyObject, key: String) {

    let encodedData = NSKeyedArchiver.archivedData(withRootObject: value)
    UserDefaults.standard.set(encodedData, forKey: key)
    UserDefaults.standard.synchronize()
}

public func removeAllStorage() {
    UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
    UserDefaults.standard.synchronize()
}
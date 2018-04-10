//
//
//  Created by Agile Infoways.
//  Copyright © 2017 Agile. All rights reserved.
//

import UIKit

extension UISearchBar {
    
    /// Return UITextField from SearchBar
    var textField: UITextField? {
        return value(forKey: "searchField") as? UITextField
    }
    
    /// Set custom search icon
    ///
    /// - Parameter image: UIImage name
    func setSearchIcon(image: UIImage) {
        setImage(image, for: .search, state: .normal)
    }
    
    /// Set custom clear icon
    ///
    /// - Parameter image: UIImage name
    func setClearIcon(image: UIImage) {
        setImage(image, for: .clear, state: .normal)
    }
}

//
//  UIImageView+Extension.swift
//  NikeshTutorial
//
//  Created by Nikesh Shakya on 19/12/2022.
//

import UIKit
import SDWebImage

extension UIImage {
    
    func isTransparent() -> Bool {
        guard let alpha: CGImageAlphaInfo = self.cgImage?.alphaInfo else { return false }
        return alpha == .first || alpha == .last || alpha == .premultipliedFirst || alpha == .premultipliedLast
    }
    
    static var profilePicPlaceholder: UIImage? {
        return UIImage(named: "propic-placeholder-ic")
    }
    
    static var itemPlaceholderImage: UIImage? {
        return UIImage(named: "image-placeholder-ic")
    }
    
    class func colorForNavBar(color: UIColor) -> UIImage {
        let rect = CGRect(origin: CGPoint(x: 0,y :0), size: CGSize(width: 1.0, height: 1.0))
        
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
        return image!
    }
    
    static var favoriteOutlineIcon: UIImage? {
        return UIImage(named: "favorite-outline-ic")
    }
    
    static var favoriteFilledIcon: UIImage? {
        return UIImage(named: "favorite-filled-ic")
    }
}

extension UIImageView {
    
    func setImage(withUrlString urlString: String, defaultImage: Data? = nil, placeholderImage: UIImage? = UIImage.profilePicPlaceholder, options: SDWebImageOptions = [.refreshCached, .retryFailed], completion: SDExternalCompletionBlock? = nil) {
        var placeholder = placeholderImage
        if let defaultImage = defaultImage, let img = UIImage(data: defaultImage) {
            placeholder = img
        }
        guard let url = URL(string: urlString) else {
            self.image = placeholderImage
            return
        }
        self.sd_setImage(with: url, placeholderImage: placeholder, options: options, completed: completion)
    }
    
    func setImageRenderedAsTemplate(withUrlString urlString: String, placeholderImage: UIImage? = UIImage.profilePicPlaceholder, isTemplatable: Bool, options: SDWebImageOptions = [.refreshCached, .retryFailed, .avoidAutoSetImage], completion: SDExternalCompletionBlock? = nil) {
        guard let url = URL(string: urlString) else {
            self.image = placeholderImage
            return
        }
        self.sd_setImage(with: url, placeholderImage: placeholderImage, options: options) { [weak self] image, err, cacheType, url in
            if let _ = err {
                self?.image = image?.withRenderingMode(isTemplatable ? .alwaysTemplate : .alwaysOriginal) ?? placeholderImage
            }
            else {
                self?.image = image?.withRenderingMode(isTemplatable ? .alwaysTemplate : .alwaysOriginal)
            }
            completion?(image, err, cacheType, url)
        }
    }
    
    func setBoolIcon(selected: Bool, selectedImage: UIImage?, unselectedImage: UIImage?) {
        self.image = selected ? selectedImage : unselectedImage
    }
    
    func setFavoriteIcon(isFavorite: Bool) {
        self.image = isFavorite ? .favoriteFilledIcon : .favoriteOutlineIcon
    }
}

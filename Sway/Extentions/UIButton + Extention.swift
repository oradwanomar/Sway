//
//  UIButton + Extention.swift
//  Sway
//
//  Created by Omar Ahmed on 13/06/2022.
//

import UIKit

extension NSTextAttachment {
    func setImageHeight(height: CGFloat) {
        guard let image = image else { return }
        let ratio = image.size.width / image.size.height
        
        bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: ratio * height, height: height)
    }
}

extension UIButton {
    
    func setButtonTitleWithLeftImage(title: String, btnImage: String , customFont: UIFont , color: UIColor, imageColor: UIColor , imageSize: CGFloat, isImageOriginal: Bool = false) {
        let attributedText = NSMutableAttributedString(string:"" , attributes:[NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: color])
        
        let font = customFont
        var Img = UIImage()
        if isImageOriginal {
            Img = UIImage(named: btnImage)!
        } else {
            Img = (UIImage(named: btnImage)?.withRenderingMode(.alwaysTemplate).withTintColor(imageColor))!
        }
        let Image = NSTextAttachment()
        
        Image.image = Img
        Image.bounds = CGRect(x: 0, y: (font.capHeight - imageSize).rounded() / 2, width: imageSize, height: imageSize)
        Image.setImageHeight(height: imageSize)
        let imgString = NSAttributedString(attachment: Image)
        attributedText.append(imgString)
        
        attributedText.append(NSAttributedString(string: " \(title)", attributes: [NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: color]))
        
        self.setAttributedTitle(attributedText, for: .normal)
    }

    func setButtonTitleWithRightImage(title: String, btnImage: String , customFont: UIFont , color: UIColor, imageColor: UIColor ,imageSize: CGFloat, isImageOriginal: Bool = false) {
        let attributedText = NSMutableAttributedString(string:"\(title) " , attributes:[NSAttributedString.Key.font: customFont, NSAttributedString.Key.foregroundColor: color])
        
        let font = customFont
        var Img = UIImage()
        if isImageOriginal {
            Img = UIImage(named: btnImage)!
        } else {
            Img = (UIImage(named: btnImage)?.withRenderingMode(.alwaysTemplate).withTintColor(imageColor))!
        }
        let Image = NSTextAttachment()
        Image.image = Img
        Image.bounds = CGRect(x: 0, y: (font.capHeight - imageSize).rounded() / 2, width: imageSize, height: imageSize)
        Image.setImageHeight(height: imageSize)
        let imgString = NSAttributedString(attachment: Image)
        attributedText.append(imgString)
        
        self.setAttributedTitle(attributedText, for: .normal)
    }
    
}


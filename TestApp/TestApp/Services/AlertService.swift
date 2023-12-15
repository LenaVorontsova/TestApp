//
//  AlertService.swift
//  TestApp
//
//  Created by Елена Воронцова on 15.12.2023.
//

import UIKit

final class AlertService {
    
    func showAlert(style: UIAlertController.Style, title: String?, message: String?, actions: [UIAlertAction] = [UIAlertAction(title: "OK", style: .cancel, handler: nil)], completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        alert.view.tintColor = .darkGray
        var imageAttachment = NSTextAttachment()
        var title = title
        if title == "green" {
            imageAttachment = NSTextAttachment(image: UIImage(systemName: "exclamationmark.circle")!.withTintColor(.green, renderingMode: .alwaysTemplate))
            title = ""
        } else if title == "yellow" {
            imageAttachment = NSTextAttachment(image: UIImage(systemName: "exclamationmark.circle")!.withTintColor(.yellow, renderingMode: .alwaysTemplate))
            title = ""
        } else if title == "red" {
            imageAttachment = NSTextAttachment(image: UIImage(systemName: "exclamationmark.circle")!.withTintColor(.red, renderingMode: .alwaysTemplate))
            title = ""
        }
        imageAttachment.bounds = CGRect(x: 0, y: -12.5, width: 30, height: 30)
        let image = NSMutableAttributedString(attachment: imageAttachment)
        let titleString = NSMutableAttributedString(string: title!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17), NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        let messageString = NSMutableAttributedString(string: message!, attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15), NSMutableAttributedString.Key.foregroundColor: UIColor.white])
        let returnString = NSMutableAttributedString(string: "\n")
        if title == "" {
            image.append(titleString)
            returnString.append(messageString)
            alert.setValue(image, forKey: "attributedTitle")
            alert.setValue(returnString, forKey: "attributedMessage")
        } else if title == "clear" && message == "clear" {
            alert.title = nil
            alert.message = nil
        } else {
            alert.setValue(titleString, forKey: "attributedTitle")
            alert.setValue(messageString, forKey: "attributedMessage")
        }
        for action in actions {
            alert.addAction(action)
        }
        if let topViewController = UIApplication.getTopMostViewController() {
            alert.popoverPresentationController?.sourceView = topViewController.view
            alert.popoverPresentationController? .sourceRect = CGRect(x: topViewController.view.bounds.midX, y: topViewController.view.bounds.midY, width: 0, height: 0)
            alert.popoverPresentationController?.permittedArrowDirections = []
            alert.pruneNegativeWidthConstraints()
            if UIApplication.getTopMostViewController()!.isKind(of: UIAlertController.self) {
                return
            } else {
                topViewController.present(alert, animated: true, completion: nil)
            }
        }
    }
}

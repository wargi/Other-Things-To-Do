//
//  FiveStartRating.swift
//  BoxOffice
//
//  Created by 박소정 on 20/08/2019.
//  Copyright © 2019 sangwook park. All rights reserved.
//

import UIKit

let kSpacing = 8
let kStarSize: CGFloat = 44.0

class FiveStartRating: UIStackView {
   
   private var ratingButton = [UIButton]()
   var rating: Double = 0 {
      didSet {
         updateButtonSelectionStates()
         NotificationCenter.default.post(name: NSNotification.Name("rating"),
                                         object: nil,
                                         userInfo: ["rating" : self.rating])
      }
   }
   var starCount = 5 {
      didSet {
         setUpButton()
      }
   }
   
   override init(frame: CGRect) {
      super.init(frame: frame)
      
      isUserInteractionEnabled = true
      spacing = 8
      setUpButton()
   }
   
   required init(coder: NSCoder) {
      super.init(coder: coder)
      
      setUpButton()
   }
   
   func setUpButton() {
      for button in ratingButton {
         removeArrangedSubview(button)
         button.removeFromSuperview()
      }
      ratingButton.removeAll()
      
      for index in 0 ..< starCount {
         let button = UIButton()
         
         button.setImage(UIImage(named: "ic_star_large"), for: .normal)
         button.setImage(UIImage(named: "ic_star_large_full"), for: .selected)
         button.tag = index
         
         let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction(sender:)))
         button.addGestureRecognizer(tap)
         
         addArrangedSubview(button)
         
         ratingButton.append(button)
      }
      updateButtonSelectionStates()
      
      let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleSelection(_:)))
      longPress.minimumPressDuration = 0.1
      addGestureRecognizer(longPress)
   }
   
   @objc func tapAction(sender: UITapGestureRecognizer) {
      let location = sender.location(in: self.superview)
      detectWhichStar(location: location)
   }
   
   @objc func handleSelection(_ press: UILongPressGestureRecognizer) {
      let location = press.location(in: self.superview)
      
      detectWhichStar(location: location)
   }
   
   func detectWhichStar(location: CGPoint) {
      for (index, button) in ratingButton.enumerated() {
         if index == 0 {
            let lframe = CGRect(x: button.bounds.origin.x - button.bounds.size.width,
                                y: button.bounds.origin.y,
                                width: button.bounds.size.width,
                                height: button.bounds.size.height)
            let frame = button.convert(lframe, to: self.superview)
            if frame.contains(location) {
               rating = Double(index)
            }
         }
         
         let lFrame = CGRect(x: button.bounds.origin.x,
                             y: button.bounds.origin.y,
                             width: button.bounds.size.width / 2,
                             height: button.bounds.size.height)
         var frame = button.convert(lFrame, to: self.superview)
         if frame.contains(location) {
            rating = Double(index) + 0.5
         }
         
         let rFrame = CGRect(x: button.bounds.maxX / 2,
                             y: button.bounds.origin.y,
                             width: button.bounds.size.width / 2,
                             height: button.bounds.size.height)
         frame = button.convert(rFrame, to: self.superview)
         if frame.contains(location) {
            rating = Double(index) + 1.0
         }
      }
   }
   
   func updateButtonSelectionStates() {
      for (index, button) in ratingButton.enumerated() {
         let tempIndex = Int(rating)
      
         button.isSelected = Double(index) < rating
         if rating.truncatingRemainder(dividingBy: 1.0) == 0.5 && tempIndex == index {
            button.setImage(UIImage(named: "ic_star_large_half"), for: .selected)
         } else {
            button.setImage(UIImage(named: "ic_star_large_full"), for: .selected)
         }
      }
   }
}

//
//  RatingControl.swift
//  FoodManagement
//
//  Created by CNTT on 5/7/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    private var ratingButton = [UIButton]()
    @IBInspectable var ratingValue:Int = 0
        {
        didSet{
            updateRatingButtonState()
        }
    }
    
    @IBInspectable var startNumber:Int = 5{
        didSet {
            setupRatingControl()
        }
    }
    @IBInspectable var startSize:CGSize = CGSize(width: 44.0, height: 44.0)
    
    //MARK: Constructer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupRatingControl();
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupRatingControl()
    }
    
    //MARK: Defrine of setup rating control
    private func setupRatingControl(){
        //Load the rating image
        let bundle = Bundle(for: type(of: self))
        
        let normal = UIImage(named: "normal", in: bundle, compatibleWith: .none)
        let pressed = UIImage(named: "pressed", in: bundle, compatibleWith: .none)
        let selected = UIImage(named: "selected", in: bundle, compatibleWith: .none)
        
        //Remove all old rating button
        for button in ratingButton{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButton.removeAll()
        
        for _ in 0..<startNumber{
            //Create rating buttons
            let button = UIButton()
            //button.backgroundColor = UIColor.red
            button.setImage(normal, for: .normal)
            button.setImage(selected, for: .selected)
            button.setImage(pressed, for: .highlighted)
            
            //setup button's prototies
            button.heightAnchor.constraint(equalToConstant: startSize.height).isActive = false;
            button.widthAnchor.constraint(equalToConstant: startSize.width).isActive = false;
            //add rating button's Action
            button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            // Add this button to the stack view
            addArrangedSubview(button)
            
            // Add the button to array maneger thame
            ratingButton.append(button)
        }
        
        updateRatingButtonState()
    }
    
    //MARK: button's Action
    @objc private func ratingButtonPressed(button:UIButton){
        //print("Called");
        if let index = ratingButton.firstIndex(of: button){
            //print("Number of the button is: \(index + 1)")
            if ratingValue == index + 1{
                ratingValue -= 1;
            }else{
                ratingValue = index + 1;
            }
        }
        //enumerated tra ve bo gia tri
        updateRatingButtonState()
    }
    
    //MARK: Update rating button state
    private func updateRatingButtonState(){
        for (i, button) in ratingButton.enumerated(){
            button.isSelected = i < ratingValue;
        }
    }
}

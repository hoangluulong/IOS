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
        
        for _ in 0..<5{
            //Create rating buttons
            let button = UIButton()
            button.backgroundColor = UIColor.red
            //setup button's prototies
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true;
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true;
            //add rating button's Action
            button.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            // Add this button to the stack view
            addArrangedSubview(button)
            
            // Add the button to array maneger thame
            ratingButton.append(button)
        }
    }
    
    //MARK: button's Action
    @objc private func ratingButtonPressed(button:UIButton){
        //print("Called");
        if let index = ratingButton.firstIndex(of: button){
            print("Number of the button is: \(index + 1)")
        }
    }
}

//
//  CollapsibleDatePickerView.swift
//  CollapsibleDatePickerView
//
//  Created by M.A.R.G on 5/14/1399 AP.
//  Copyright © 1399 M.A.R.G. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
@IBDesignable
public class CollapsibleDatePickerView: UIView{
    
    public var doneButtonBackgroundColor: UIColor = #colorLiteral(red: 0.9279228449, green: 0.08350463957, blue: 0.3807854056, alpha: 1)  {
        didSet{
            doneButton.backgroundColor = doneButtonBackgroundColor
        }
    }
    public var dateType: UIDatePicker.Mode = UIDatePicker.Mode.date{
        didSet{
            datePickerView.datePickerMode = dateType
        }
    }
    private let blurView: UIView = {
       let view = UIView()
       view.backgroundColor = UIColor.black.withAlphaComponent(0.7)
       view.translatesAutoresizingMaskIntoConstraints = false
       view.alpha = 0
       return view
    }()
    private let dateContainerView: UIView = {
       let view = UIView()
       view.backgroundColor = UIColor.white
       view.translatesAutoresizingMaskIntoConstraints = false
       view.transform = CGAffineTransform(translationX: 0, y: 999)
       view.clipsToBounds = true
       view.layer.cornerRadius = 20
       return view
    }()

    private lazy var doneButton: UIButton = {
       let button = UIButton(type: .system)
       button.setTitle("Done", for: .normal)
       button.setTitleColor(UIColor.white, for: .normal)
       button.backgroundColor = doneButtonBackgroundColor
       button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
       button.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
       button.translatesAutoresizingMaskIntoConstraints = false
       button.layer.cornerRadius = 12
       return button
    }()
    
    private let datePickerView: UIDatePicker = {
       let dp = UIDatePicker()
       dp.backgroundColor = UIColor.white
       dp.translatesAutoresizingMaskIntoConstraints = false
       dp.datePickerMode = UIDatePicker.Mode.countDownTimer
       return dp
    }()
    
    
    //create programatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    public var selectedDate: ((Date) -> ())?
    
    fileprivate func setUpViews(){
        self.isHidden = true
        addSubview(blurView)
        addSubview(dateContainerView)

        dateContainerView.addSubview(datePickerView)
        dateContainerView.addSubview(doneButton)
        
        blurView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        blurView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        blurView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        blurView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        dateContainerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        dateContainerView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        dateContainerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        dateContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.40).isActive = true
  
        datePickerView.topAnchor.constraint(equalTo: dateContainerView.topAnchor).isActive = true
        datePickerView.leadingAnchor.constraint(equalTo: dateContainerView.leadingAnchor).isActive = true
        datePickerView.heightAnchor.constraint(equalTo: dateContainerView.heightAnchor, multiplier: 0.75).isActive = true
        datePickerView.trailingAnchor.constraint(equalTo: dateContainerView.trailingAnchor).isActive = true

        doneButton.topAnchor.constraint(equalTo: datePickerView.bottomAnchor,constant: 12).isActive = true
        doneButton.leadingAnchor.constraint(equalTo: datePickerView.leadingAnchor,constant: 12).isActive = true
        doneButton.bottomAnchor.constraint(equalTo: dateContainerView.bottomAnchor,constant: -12).isActive = true
        doneButton.trailingAnchor.constraint(equalTo: dateContainerView.trailingAnchor,constant: -12).isActive = true
    }

    @objc fileprivate func handleSave(button: UIButton){
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.dateContainerView.transform = CGAffineTransform(translationX: 0, y: 999)
            self.selectedDate?(self.datePickerView.date)
        }) { (completed) in
            UIView.animate(withDuration: 0.2, animations: {
                 self.blurView.alpha = 0
            }) { (_) in
                self.isHidden = true
            }
        }
    }
    
    public func show(){
        self.isHidden = false
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blurView.alpha = 1
            self.dateContainerView.transform = .identity
        })
    }

}



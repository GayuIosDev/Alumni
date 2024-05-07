//
//  EducationCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 01/02/24.
//

import UIKit

class EducationCollectionViewCell: UICollectionViewCell, UITextFieldDelegate {
    @IBOutlet weak var highClassTextField: UITextField!
    
    
    @IBOutlet weak var schoolNameLbl: UILabel!
    
    
    @IBOutlet weak var didnLblHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var newschollListHeight: NSLayoutConstraint!
    
    @IBOutlet weak var btns: UIButton!
    @IBOutlet weak var RemoveView: UIViewX!
    @IBOutlet weak var classJoinedTextField: UITextField!
    @IBOutlet weak var yearPassedOutTextField: UITextField!
    
   
    @IBOutlet weak var districtTextField: UITextField!
    
    
    @IBOutlet weak var saveView: UIViewX!
    @IBOutlet weak var stateTextField: UITextField!
    
    @IBOutlet weak var schoolNameTextfield: UITextField!
    
    @IBOutlet weak var countryTextField: UITextField!
    
    
    @IBOutlet weak var classPassedOutView: UIViewX!
    
    
    
    @IBOutlet weak var yearPassedOutView: UIViewX!
     
    @IBOutlet weak var highClassStudiedView: UIViewX!
    
    
    @IBOutlet weak var classJoinedView: UIViewX!
    
    @IBOutlet weak var schoolListView: UIViewX!
    
    @IBOutlet weak var yearJoinedTextField: UITextField!
    
    @IBOutlet weak var districtView: UIViewX!
    
    @IBOutlet weak var stateView: UIViewX!
    
    @IBOutlet weak var countryView: UIViewX!
    
    
    @IBOutlet weak var newSchoolListView: UIView!
    
    @IBOutlet weak var didnLbl: UILabel!
    
    @IBOutlet weak var clickHereLbl: UILabel!
    
    
    var mainVc  : UIViewController!
    var call_back: ((String) -> Void)?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        highClassTextField.delegate = self



        classJoinedTextField.delegate = self

        yearJoinedTextField.delegate = self



        yearPassedOutTextField.delegate = self

        print("yerJoi",yearJoinedTextField.text)
        
        saveView.isHidden = true
        
        clickHereLbl.isHidden = true
        newSchoolListView.isHidden = true
        didnLbl.isHidden = true
        didnLblHeight.constant = 0
        newschollListHeight.constant = 0
        // Initialization code
        
        addDoneButtonOnKeyboard()
        
     
       

    }
    
    
    
    
    
    
    func addDoneButtonOnKeyboard(){
            let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
            doneToolbar.barStyle = .default

            let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

            let items = [flexSpace, done]
            doneToolbar.items = items
            doneToolbar.sizeToFit()
        classJoinedTextField.inputAccessoryView = doneToolbar

        highClassTextField.inputAccessoryView = doneToolbar
        }

        @objc func doneButtonAction(){
            let  int1 = Int(classJoinedTextField.text!)
                                    let int2 = Int(highClassTextField.text!)
                                    
                     
                                    
                                    let optionalInt1: Int? = int1
                                    let optionalInt2: Int? = int2

                                    // Check if both optionals have values before comparison
                                    if let value1 = optionalInt1, let value2 = optionalInt2 {
                                        if value1 >= value2 {
                                            print("Value 1 is greater than or equal to value 2")
                                            
                                            mainVc.view.makeToast("Class of leaving should not less than class of joining")
                                            
                                            
                                            
                                            
                                            highClassTextField.text = nil
                                            highClassTextField.placeholder = "Class of Leaving"
                        //                    highClassTextField.text = "Class of Leaving"
                                            
                                        } else {
                                            print("Value 1 is less than value 2")
                                            classJoinedTextField.resignFirstResponder()

                                           
                                        }
                                    } else {
                                        print("One or both of the values are nil")
                                    }
            
            classJoinedTextField.resignFirstResponder()
            highClassTextField.resignFirstResponder()
        }
    

    
    
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
                   
        //        sucessImageView.image = UIImage(named: "sendRocket")
                
               
                print("printssssssssssss",textField.text)
                
        let modl = EducationDataDetailModal()
            if textField == classJoinedTextField{
                
                
               
                
                
              



                



                modl.class_joined = textField.text



           

                



               


                
             
            }else if textField == highClassTextField{
                
                
               
                modl.class_passed_out = highClassTextField.text




                
                
            }
        else if textField == schoolNameTextfield{
            
            
            
//            modl.institute_id = 2



            print(".AllModalVale23232")

            
        }else if textField == yearJoinedTextField{
            
//            modl.year_joined = Int(textField.text!)

            print(".AllModalVale111")

            
        }
        else if textField == yearPassedOutTextField{
            
//            modl.year_passed_out = Int(textField.text!)
            print(".AllModalVale")
        }
            
        
        
        modl.institute_id =   Constant.DefaultsKeys.InstuteId
        modl.year_joined = Constant.DefaultsKeys.YearJoined
        modl.year_passed_out = Constant.DefaultsKeys.YearPassedOut
        
        Constant.DefaultsKeys.AllModalVale.append(modl)

            
        print(" Constant.DefaultsKeys.AllModalVale", modl.class_joined)
        print(" modl.class_passed_outmodl.class_passed_out", modl.class_passed_out)
        print(" Constant.DefaultsKeys.year_joined",   Constant.DefaultsKeys.YearJoined)
        print(" Constant.DefaultsKeys.year_passed_out",   Constant.DefaultsKeys.YearPassedOut)
        print(" Constant.DefaultsKeys.institute_id",   Constant.DefaultsKeys.InstuteId)
                }
            
            
           
        //
          
        //
            func textFieldDidChangeSelection(_ textField: UITextField) {
              
        //        searchCloseView.isHidden = true
                
                
                
                
                if textField == classJoinedTextField{
                    
                    print("sarammmad ad fwfad43432432",textField.text)
                    
                    if classJoinedTextField.text != ""{
                        
                        highClassTextField.isUserInteractionEnabled = true
                        print("sarwwwwwwwwww")
                    }
                    
                    else{
                        highClassTextField.isUserInteractionEnabled = false
                        
                        print("sarwwwwwwwwww1111111")
                    }
                }
                else if textField == highClassTextField{
                    print("sarwwwwwwwwww1111111",textField.text)
                    
                   
                    
                }
            }
            
            
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
//            companyName.resignFirstResponder()
//            desingnationTextField.resignFirstResponder()
//            
//            
//          return true
//        }



            func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
                print("While entering the characters this method gets called")
                
                
                
                print("yerJoi",yearJoinedTextField.text)
    //            companyName.resignFirstResponder()
             
                return true
            }
    
}

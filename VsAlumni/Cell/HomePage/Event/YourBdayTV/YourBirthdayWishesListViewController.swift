//
//  YourBirthdayWishesListViewController.swift
//  VsAlumni
//
//  Created by admin on 19/01/24.
//

import UIKit
import CryptoKit
import CryptoSwift

class YourBirthdayWishesListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var bdayTitle: UILabel!
    @IBOutlet weak var bdayDescLbl: UILabel!
    @IBOutlet weak var tv: UITableView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var getMediaInstituteRef : [bdayReferenceMedia] = []
    
    let rowId = "BirthdayWishesTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()

        overrideUserInterfaceStyle = .light

        
        tv.dataSource = self
        tv.delegate = self
        
        
        tv.register(UINib(nibName: rowId, bundle: nil), forCellReuseIdentifier: rowId)
        
        
        
        let backGest = UITapGestureRecognizer(target: self, action: #selector(backVc))
        backView.addGestureRecognizer(backGest)
    }
    
    
    
    @IBAction func backVc() {
        dismiss(animated: true)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getMediaInstituteRef.count
//        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: rowId, for: indexPath) as! BirthdayWishesTableViewCell
        
        cell.selectionStyle = .none
        
        let mediaRef : bdayReferenceMedia = getMediaInstituteRef[indexPath.row]
        cell.nameLbl.text = mediaRef.sender_name
        let password: [UInt8] = Array("EVO7IC37SNAPCC29DAE7PVTC80M6U4R4UAG5ANB01544CBA61LTD".utf8)
        let salt: [UInt8] = Array("120495030296".utf8)
        let iv: [UInt8] = Array("120495V6OICMUSNA".utf8)
        
        
        
        var decrypted = ""
        var demoImgdecrypted = ""
        
        do {
            let key = try PKCS5.PBKDF2(
                password: password,
                salt: salt,
                iterations: 1,
                keyLength: 32,
                variant: .sha1
            ).calculate()
            
            let newvalue = mediaRef.content.replacingOccurrences(of: "\r\n", with: "")
            decrypted = try newvalue.decryptBase64ToString(cipher: AES(key: key, blockMode: .CBC(iv: iv), padding: .pkcs7))
            
            cell.wishesLbl.text = decrypted
        } catch {
                print("error encryption",error)
            }
        
     
        cell.imgView.sd_setImage(with: URL(string:  mediaRef.sender_profile!), placeholderImage: UIImage(named: "image 2"))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let mediaRef : bdayReferenceMedia = getMediaInstituteRef[indexPath.row]
        
        let storyboard = UIStoryboard(name: "ChatSendingStoryboard", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController() as! ChatSendingViewController
        viewController.bdayRedirect = "Event"
        viewController.user_id  = mediaRef.receiver_id
        viewController.selectedUserId  = mediaRef.sender_id
        viewController.userName = mediaRef.sender_name
        viewController.userImg = mediaRef.sender_profile
        viewController.chatWishType = 2
//        viewController.cNameStr = mediaRef.companyName
//
//        viewController.instituteNameStr = mediaRef.instituteName
//        viewController.designationStr = ges.redirectName
//        viewController.batchStr = getAlumni.batch
//
       
        viewController.IsBday = true
        
        

        present(viewController, animated: true)
        
        
    }
    
    
    
//    @IBAction func chatRedirect( ges : ChatRedirctGesture) {
//        
//        let storyboard = UIStoryboard(name: "ChatSendingStoryboard", bundle: nil)
//        let viewController = storyboard.instantiateInitialViewController() as! ChatSendingViewController
//        viewController.bdayRedirect = "Event"
//        viewController.user_id  = ges.redirectId
//        viewController.selectedUserId  = ges.redirectId
//        viewController.userName = ges.redirectName
//        viewController.userImg = ges.redirectProfile
//        viewController.chatWishType = 1
////        viewController.designationStr = ges.redirectName
//        
//        print("ges.redirectId",ges.redirectId)
//        print("ges.redirectName",ges.redirectName)
//        print("ges.redirectProfile",ges.redirectProfile)
//
//        viewController.IsBday = true
//        
//        
//
//        self.main_vc.present(viewController, animated: true)
//   
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105
    }

}

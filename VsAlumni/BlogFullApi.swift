//
//  BlogFullApi.swift
//  VsAlumni
//
//  Created by admin on 22/03/24.
//

import Foundation


/*func crateAlumniBlog() {
    
    
    let createBlogModal = CreateAlumniBlogsModal()
    createBlogModal.title = editId
    createBlogModal.content = eventNameTextField.text
    createBlogModal.category_id = eventTitleTextField.text
    createBlogModal.type = descTextField.text
    createBlogModal.url = venueTextField.text
    createBlogModal.is_published = validateStartDate
    createBlogModal.reference_media = validateEndDate
    
    
    
    
    
    
    var  createBlogModalStr = createBlogModal.toJSONString()
    print("createBlogModalStr",createBlogModalStr.toJSON())
    print("createBlogModalStr",createBlogModalStr)
    print("token",token)
    
    CreateAlumniBlogsModal.call_request(param: createBlogModalStr!,token: token) {
        
        
        
        [self] (res) in
        
        
        
        let CreateAlumniBlogRes : CreateAlumniBlogResponse = Mapper<CreateAlumniBlogResponse>().map(JSONString: res)!
        
        
        if CreateAlumniBlogRes.status == true {
            
            //            print("CreateAlumniBlogRes",CreateAlumniBlogRes.message)
            //
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "successImage"
            //            viewController.messageResponse = creaveEventRes.message
            //
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
            //
            
        }else{
            
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "failureImage"
            //            viewController.messageResponse = creaveEventRes.message
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
        }
        
        
    }
    
    
}




func crateInstituteBlog() {
    
  
    let createBlogModal = CreateInstituteBlogsModal()
    createBlogModal.title = editId
    createBlogModal.institute_id = editId
    createBlogModal.content = eventNameTextField.text
    createBlogModal.category_id = eventTitleTextField.text
    createBlogModal.type = descTextField.text
    createBlogModal.url = venueTextField.text
    createBlogModal.is_published = validateStartDate
    createBlogModal.reference_media = validateEndDate
    
    
    
    
    
    
    var  createBlogModalStr = createBlogModal.toJSONString()
    print("createBlogModalStr",createBlogModalStr.toJSON())
    print("createBlogModalStr",createBlogModalStr)
    print("token",token)
    
    CreateInstituteBlogsRequest.call_request(param: createBlogModalStr!,token: token) {
        
        
        
        [self] (res) in
        
        
        
        let CreateInstituteBlogRes : CreateInstituteBlogs = Mapper<CreateInstituteBlogs>().map(JSONString: res)!
        
        
        if CreateInstituteBlogRes.status == true {
            
            //            print("CreateAlumniBlogRes",CreateAlumniBlogRes.message)
            //
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "successImage"
            //            viewController.messageResponse = creaveEventRes.message
            //
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
            //
            
        }else{
            
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "failureImage"
            //            viewController.messageResponse = creaveEventRes.message
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
        }
        
        
    }
    
    
}




func deleteBlog() {
    
  
    let deleteBlogModal = DeleteBlogModal()
    deleteBlogModal.blog_id = editId
    
    
    
    
    var  deleteBlogModalStr = deleteBlogModal.toJSONString()
    print("deleteBlogModalStr",deleteBlogModalStr.toJSON())
    print("deleteBlogModalStr",deleteBlogModalStr)
    print("token",token)
    
    DeleteBlogRequest.call_request(param: createBlogModalStr!,token: token) {
        
        
        
        [self] (res) in
        
        
        
        let deleteBlogRes : DeleteBlogResponse = Mapper<DeleteBlogResponse>().map(JSONString: res)!
        
        
        if deleteBlogRes.status == true {
            
            //            print("CreateAlumniBlogRes",CreateAlumniBlogRes.message)
            //
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "successImage"
            //            viewController.messageResponse = creaveEventRes.message
            //
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
            //
            
        }else{
            
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "failureImage"
            //            viewController.messageResponse = creaveEventRes.message
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
        }
        
        
    }
    
    
}




func updateBlog() {
    var blog_id : Int!
    var blog_title : String!
    var is_published : Int!
    var content_name : String!
    var type : String!
    var url : String!
    var reference_media : [UpdateBlogReferenceMedia]!
    
  
    let updateBlogModal = UpdateBlogModal()
    updateBlogModal.blog_id = editId
    
    updateBlogModal.blog_title = editId
    updateBlogModal.is_published = editId
    updateBlogModal.content_name = eventNameTextField.text
    updateBlogModal.type = eventTitleTextField.text
    updateBlogModal.url = descTextField.text
    updateBlogModal.reference_media = validateEndDate
    
    
    var  updateBlogModalStr = updateBlogModal.toJSONString()
    print("deleteBlogModalStr",updateBlogModalStr.toJSON())
    print("deleteBlogModalStr",updateBlogModalStr)
    print("token",token)
    
    updateBlogModal.call_request(param: updateBlogModalStr!,token: token) {
        
        
        
        [self] (res) in
        
        
        
        let updateBlogRes : UpdateBlogModalResponse = Mapper<UpdateBlogModalResponse>().map(JSONString: res)!
        
        
        if updateBlogRes.status == true {
            
            //            print("CreateAlumniBlogRes",CreateAlumniBlogRes.message)
            //
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "successImage"
            //            viewController.messageResponse = creaveEventRes.message
            //
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
            //
            
        }else{
            
            //            let storyboard = UIStoryboard(name: "ImageChangeImageStoryboard", bundle: nil)
            //            let viewController = storyboard.instantiateInitialViewController() as! ImageChangeImageViewController
            //            viewController.alertShowType = 1
            //            viewController.gifImage = "failureImage"
            //            viewController.messageResponse = creaveEventRes.message
            //            KRProgressHUD.dismiss()
            //            self.present(viewController, animated: true)
        }
        
        
    }
    
    
}



func GetAllInstituteBlogs(){

//        cvBottom.isHidden = false
    
   
        let param : [String : Any] =
        [
            "institute_id": 10,
           
        ]
       
       
       
        print("token",token)
        print("param899889",param)
        
    GetAllInstituteBlogsRequest.call_request(param: param,token: token){ [self]
            (res) in
          
                let GetAllInstituteBlogsRes : GetAllInstituteBlogsResponse = Mapper<GetAllInstituteBlogsResponse>().map(JSONString: res)!
                
                if GetAllInstituteBlogsRes.status == true {
                    
//                    getNetWorkAlumniData = alumniNetworkResponse.data
//                    getNetWorkAlumniData2.append(contentsOf: getNetWorkAlumniData)
//                                        alumni_clone_list = alumniNetworkResponse.data
//                    
//                    
//                    cvBottom.isHidden = false
//
//                    cvBottom.dataSource = self
//                    cvBottom.delegate = self
//                    
//                    cvBottom.reloadData()
                    //
                    
                }else{
                    
                    
//                    cvBottom.isHidden = true
//                    
//                    //                    noRecordsView.isHidden = false
//                    noRecordView.isHidden = false
//                    noRecordLbl.isHidden = false
//                    gifImage.isHidden = false
////                        noRecordLbl.text = alumniNetworkResponse.message
//                    self.gifImage.image = UIImage.gif(name: "no_data_found")
                    
                }
                
            }
        }
    }




func GetBlogDetails(){

//        cvBottom.isHidden = false
    
   
        let param : [String : Any] =
        [
            "blog_id": 10,
           
        ]
       
       
       
        print("token",token)
        print("param899889",param)
        
    GetBlogDetailsRequest.call_request(param: param,token: token){ [self]
            (res) in
          
                let getblogdetailsRes : GetBlogDetailsResponse = Mapper<GetBlogDetailsResponse>().map(JSONString: res)!
                
                if getblogdetailsRes.status == true {
                    
//                    getNetWorkAlumniData = alumniNetworkResponse.data
//                    getNetWorkAlumniData2.append(contentsOf: getNetWorkAlumniData)
//                                        alumni_clone_list = alumniNetworkResponse.data
//
//
//                    cvBottom.isHidden = false
//
//                    cvBottom.dataSource = self
//                    cvBottom.delegate = self
//
//                    cvBottom.reloadData()
                    //
                    
                }else{
                    
                    
//                    cvBottom.isHidden = true
//
//                    //                    noRecordsView.isHidden = false
//                    noRecordView.isHidden = false
//                    noRecordLbl.isHidden = false
//                    gifImage.isHidden = false
////                        noRecordLbl.text = alumniNetworkResponse.message
//                    self.gifImage.image = UIImage.gif(name: "no_data_found")
                    
                }
                
            }
        }
    }



func GetBlogTypeList(){

//        cvBottom.isHidden = false
    
   
        let param : [String : Any] =
        [
            "blog_id": 10,
           
        ]
       
       
       
        print("token",token)
        print("param899889",param)
        
    GetBlogTypeListRequest.call_request(param: param,token: token){ [self]
            (res) in
          
                let GetBlogTypeListRes : GetBlogTypeListReponse = Mapper<GetBlogTypeListReponse>().map(JSONString: res)!
                
                if GetBlogTypeListRes.status == true {
                    
//                    getNetWorkAlumniData = alumniNetworkResponse.data
//                    getNetWorkAlumniData2.append(contentsOf: getNetWorkAlumniData)
//                                        alumni_clone_list = alumniNetworkResponse.data
//
//
//                    cvBottom.isHidden = false
//
//                    cvBottom.dataSource = self
//                    cvBottom.delegate = self
//
//                    cvBottom.reloadData()
                    //
                    
                }else{
                    
                    
//                    cvBottom.isHidden = true
//
//                    //                    noRecordsView.isHidden = false
//                    noRecordView.isHidden = false
//                    noRecordLbl.isHidden = false
//                    gifImage.isHidden = false
////                        noRecordLbl.text = alumniNetworkResponse.message
//                    self.gifImage.image = UIImage.gif(name: "no_data_found")
                    
                }
                
            }
        }
    }*/

//
//  AlumniCollectionViewCell.swift
//  VsAlumni
//
//  Created by admin on 12/10/23.
//

import UIKit

class AlumniCollectionViewCell: UICollectionViewCell, UITableViewDataSource, UITableViewDelegate,UISearchBarDelegate{

    @IBOutlet weak var search_bar: UISearchBar!
    @IBOutlet weak var tv: UITableView!
    
    
    let rowIdentifier = "AlumniMembersListTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tv.dataSource = self
        tv.delegate = self
        search_bar.delegate = self
        
        
        
        tv.register(UINib(nibName: rowIdentifier, bundle: nil), forCellReuseIdentifier: rowIdentifier)
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: rowIdentifier, for: indexPath) as! AlumniMembersListTableViewCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    
 
    
    
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        let filtered_list : [OrderListResponse] = Mapper<OrderListResponse>().mapArray(JSONString: clone_list.toJSONString()!)!
//
//        if !searchText.isEmpty{
//            pending_order = filtered_list.filter { $0.mobile_number.lowercased().contains(searchText.lowercased()) ||
//                   $0.amount.lowercased().contains(searchText.lowercased()) ||
//                   $0.order_display_id.lowercased().contains(searchText.lowercased()) ||
//                $0.time.lowercased().contains(searchText.lowercased()) ||
//                $0.order_status.lowercased().contains(searchText.lowercased())
//               }
//
//
//        }else{
//            pending_order = filtered_list
//            print("pendingOrder")
//        }
//
//            if pending_order.count > 0{
//                print ("searchListPendigCount",pending_order.count)
////                viewEmpty.alpha = 0
////                emptyLbl.alpha = 0
//            }else{
////                viewEmpty.alpha = 1
////                emptyLbl.alpha = 1
//            }
//
//
//
//            tv.reloadData()
////
//
//    }
        
     func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        search_bar.endEditing(true)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search_bar.endEditing(true)
    }
    
}



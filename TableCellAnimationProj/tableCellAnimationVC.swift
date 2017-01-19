//
//  tableCellAnimationVC.swift
//  TableCellAnimationProj
//
//  Created by HemendraSingh on 10/10/16.
//  Copyright © 2016 Kloudrac s/w. All rights reserved.
//

import UIKit

class tableCellAnimationVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var animationTblView: UITableView!
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if flag == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: "animationTableCellID", for: indexPath) as! animationTableCell
            return cell
        }
        else {
            self.animationTblView.rowHeight = 175
            let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackTableCellID", for: indexPath) as! animationTableCell
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 12, options: .curveLinear, animations: {
                cell.layoutIfNeeded()
                }, completion: nil)
            return cell
        }
    }
    
    
    @IBAction func BtnAction(_ sender: AnyObject) {
        self.flag = true
        let  myConstant = -48
        let point: CGPoint = sender.convert(CGPoint.zero, to:animationTblView)
        let indexPath = animationTblView.indexPathForRow(at: point)
        let cell = animationTblView.cellForRow(at: indexPath!) as! animationTableCell
        cell.rightViewMargin.constant = CGFloat(myConstant)
        cell.leftViewMargin.constant = CGFloat(myConstant)
        UIView.animate(withDuration: 0.4, animations: {
            cell.layoutIfNeeded()
            }, completion: {finished in })
        
        //self.Animation()
        Timer.scheduledTimer(timeInterval: TimeInterval(0.5), target: self, selector: #selector(tableCellAnimationVC.animateTableCell), userInfo: nil, repeats: false)
        //self.animationTblView.reloadData()
        //self.animationTblView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: UITableViewRowAnimation(rawValue: UITableViewRowAnimation.left.rawValue)!)
        
        
        /* self.animationTblView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: UITableViewRowAnimation.left)*/
        
    }
    
    func animateTableCell() {
        self.animationTblView.reloadSections(NSIndexSet(index: 0) as IndexSet, with: UITableViewRowAnimation.left)
    }
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
}

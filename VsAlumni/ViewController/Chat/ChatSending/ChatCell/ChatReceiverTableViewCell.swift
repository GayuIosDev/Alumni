//
//  ChatReceiverTableViewCell.swift
//  VsAlumni
//
//  Created by admin on 28/02/24.
//

import UIKit
import WebKit
import KRProgressHUD
import AVFAudio
import AVFoundation


class ChatReceiverTableViewCell: UITableViewCell {

    
    
    @IBOutlet weak var secondsTimeLabel: UILabel!
    
    
    
    @IBOutlet weak var pdfView: UIView!
    
    
    @IBOutlet weak var pdfClickView: UIView!
    
    @IBOutlet weak var btnName: UIButton!
    
    @IBOutlet weak var ImagePdfVideoHeight: NSLayoutConstraint!
    
    @IBOutlet weak var resiverMessaageView: UIViewX!
    
    @IBOutlet weak var ResiverimgPdfVoiceView: UIViewX!
    
    
    
    @IBOutlet weak var ResivevoicefullView: UIView!
    
    
    @IBOutlet weak var resiverDateAndTimeLbl: UILabel!
    
    @IBOutlet weak var recieverVideoDateLbl: UILabel!
    
    @IBOutlet weak var recieverVideoView: UIView!
    
    
    
    @IBOutlet weak var receiverWebView: WKWebView!
    
    
    @IBOutlet weak var overAllWidth: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var overAllViewHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet weak var recieverAudioHeight: NSLayoutConstraint!
    
    @IBOutlet weak var recieverPlayImage: UIImageView!
    
    
    @IBOutlet weak var recieverImgHeight: NSLayoutConstraint!
    
    @IBOutlet weak var recieverLabelCurrentTime: UILabel!
    
    @IBOutlet weak var recieverPlayView: UIView!
    
    @IBOutlet weak var recieverSlider: UISlider!
    
    @IBOutlet weak var recieverAudioDateLbl: UILabel!
    
    @IBOutlet weak var audioView: UIView!
    
    @IBOutlet weak var messageView: UIViewX!
    
    
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var imgView: UIView!
    
    
    
    @IBOutlet weak var imgDateLbl: UILabel!
    
    
    
    @IBOutlet weak var recieverMessageLbl: UILabel!
    
    
    @IBOutlet weak var receiverDateLbl: UILabel!
    
    
    var audioFileURL: String!


var audioRecorder: AVAudioRecorder!
var audioPlayer : AVAudioPlayer!
var meterTimer:Timer!
var isAudioRecordingGranted: Bool!
var durationLable : String!
var secondsLabel  : String!

var strPlayStatus : NSString = ""


var playerItem: AVPlayerItem?
 var player: AVPlayer?
//        weak var playbackSlider: UISlider?
var timer = Timer()
var time : Float64 = 0;
var sliderIndex : NSInteger = NSInteger()
var strFilePath : String = String()

var messageId : String!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        resiverDateAndTimeLbl.text = ""
        recieverAudioDateLbl.text = ""
        recieverMessageLbl.text = ""
        receiverDateLbl.text = ""
        // Initialization code
        
        receiverWebView.scrollView.isScrollEnabled = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
    @IBAction func audioPlayBBtn(_ sender: UIButton) {
        print("ReceiveraudioFileURL",audioFileURL)
        var urls = URL(string: audioFileURL)
        
        playerItem = AVPlayerItem(url: urls!)
        player = AVPlayer(playerItem: playerItem!)
        if self.player!.currentItem?.status == .readyToPlay{
        }
          NotificationCenter.default.addObserver(self, selector: #selector(self.playerDidFinishPlaying(sender:)),
         name: NSNotification.Name.AVPlayerItemDidPlayToEndTime,
         object: player!.currentItem)
         if(btnName.isSelected)
         {
          btnName.isSelected = false
            let seconds1 : Int64 = Int64(recieverSlider.value)
             let targetTime : CMTime = CMTimeMake(value: seconds1, timescale: 1)
              //  print("pause AudioSlider:\(seconds1)")
             player!.seek(to: targetTime)
            strPlayStatus = "play"
             player?.pause()
             
             btnName.setImage(UIImage(named: "play"), for: .normal)
            //  timer.invalidate()
             
             print("start")
            }else{
             btnName.isSelected = true
           let seconds1 : Int64 = Int64(recieverSlider.value)
            let targetTime : CMTime = CMTimeMake(value: seconds1, timescale: 1)
            player!.seek(to: targetTime)
            // print("play AudioSlider:\(seconds1)")
           strPlayStatus = "play"
         player?.volume = 1
            player?.play()
                btnName.setImage(UIImage(named: "pause_icon"), for: .normal)
                createAndDownloadFile(fileNameUrl : audioFileURL)
                print("enddddd")
         }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
            
      
    
        
        do {        let str = try String(contentsOfFile: audioFileURL)
            print("lllllllll")    }
        
        catch {        print("The file could not be loaded : \(error)")    }
        
        
//            do {        let str = try String(contentsOfFile: filename)
//                print(str)    }
//            catch {        print("The file could not be loaded")    }
//
        
        
        


    }







@objc func updateSlider(){
if self.player!.currentItem?.status == .readyToPlay {

time = CMTimeGetSeconds(self.player!.currentTime())
}
let duration : CMTime = playerItem!.asset.duration
let seconds : Float64 = CMTimeGetSeconds(duration)
    recieverSlider.maximumValue = Float(seconds)
    recieverSlider.minimumValue = 0.0
    recieverSlider.value = Float(time)

    if(time > 0){
    let minutes = Int(time) / 60 % 60
    let secondss = Int(time) % 60

    let durationFormat = String(format:"%02i:%02i", minutes, secondss)
    secondsTimeLabel.text = durationFormat
     }
    if(time == seconds){
     timer.invalidate()
    btnName.isSelected = false
        recieverSlider.value = 0.0
    }
    }
    func playbackSliderValueChanged(playbackSliders:UISlider){
    let seconds : Int64 = Int64(recieverSlider.value)
     let targetTime : CMTime = CMTimeMake(value: seconds, timescale: 1)
     if(player != nil){
      player!.seek(to: targetTime)
     }else{
         recieverSlider.value = playbackSliders.value
      }
     }


        @objc func playerDidFinishPlaying(sender: Notification) {
         timer.invalidate()
            recieverSlider.value = 0.0
        player?.pause()
         btnName.isSelected = false
          playerItem?.seek(to: CMTime.zero)
            secondsTimeLabel.text = "00:00"
            btnName.setImage(UIImage(named: "play"), for: .normal)
          }
        
        
       

        func createAndDownloadFile(fileNameUrl : String) {
            
            KRProgressHUD.show()
          
                let strFilePath : String =  String(describing: fileNameUrl)
                
                let audioUrl = URL(string: strFilePath)
                
                if let audioUrl = URL(string: strFilePath) {
                    
                    
                    let documentsUrl:URL =  (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL?)!
                   // print(MessageId)
                    // lets create your destination file url
                    let strpath = String(describing: messageId) + ".wav"
                  //  print(strpath)
                    let destinationUrl = documentsUrl.appendingPathComponent(strpath)
                    
                   // let destinationUrl = documentsDirectoryURL.appendingPathComponent(strpath)
                 //   print(destinationUrl)
    //                 urlData = destinationUrl
                    // to check if it exists before downloading it
                    if FileManager.default.fileExists(atPath: destinationUrl.path) {
                        print("The file already exists at path")
                        KRProgressHUD.dismiss()
    //                    DispatchQueue.main.async {
    //                        self.performSegue(withIdentifier: "VoiceDetailSeg", sender: self)
    //                    }
                        
                        // if the file doesn't exist
                    } else {
                        
                        // you can use NSURLSession.sharedSession to download the data asynchronously
                       
                            let sessionConfig = URLSessionConfiguration.default
                            let session = URLSession(configuration: sessionConfig)
                            
                            let request = URLRequest(url:audioUrl)
                            
                            let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
                                if let tempLocalUrl = tempLocalUrl, error == nil {
                                    // Success
                                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                                        KRProgressHUD.dismiss()
                                        print("Successfully downloaded. Status code: \(statusCode)")
                                        
                                        
                                    }
                                    
                                    do {
                                        try FileManager.default.copyItem(at: tempLocalUrl, to: destinationUrl)
                                         print("Success",tempLocalUrl)
                                        print("Success1",destinationUrl)
    //                                    DispatchQueue.main.async {
    //                                        self.performSegue(withIdentifier: "VoiceDetailSeg", sender: self)
    //                                    }
                                        
                                    } catch (let writeError) {
                                        KRProgressHUD.dismiss()
                                        print("Error creating a file \(destinationUrl) : \(writeError)")
                                    }
                                    
                                } else {
                                    KRProgressHUD.dismiss()
                                    print("Error took place while downloading a file. Error description: %@", error?.localizedDescription);
                                }
                            }
                            task.resume()
                            

                    
                    
                }
            }
          
        }

        // Call the function to create and download the file
    //    createAndDownloadFile()

        
      
        
        func showToast(message : String, seconds: Double){
                let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alert.view.backgroundColor = .black
                alert.view.alpha = 0.5
                alert.view.layer.cornerRadius = 15
            
           
            self.window?.rootViewController!.present(alert, animated: true, completion: nil)
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
                    alert.dismiss(animated: true)
                }
            }
        
        
        @objc func ordersFinishedPlaying( _ myNotification:NSNotification) {



            let selectedTime: CMTime = CMTimeMake(value: Int64(0 * 1000 as Float64), timescale: 1000)

            player?.seek(to: selectedTime)


            btnName.setImage(UIImage(named: "play"), for: .normal)
            print("Player finished")



        }


    //    func stringFromTimeInterval(interval: TimeInterval) -> String {
    //
    //
    //
    //        let interval = Int(interval)
    //
    //
    //
    //        let seconds = interval % 60
    //
    //
    //
    //        let minutes = (interval / 60) % 60
    //
    //
    //
    //        let hours = (interval / 3600)
    //
    //
    //
    //        return String(format: "%02d:%02d", minutes, seconds)
    //
    //
    //
    //    }
    //
    //
    //
    //    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider) {
    //
    //
    //
    //        let seconds : Int64 = Int64(playbackSlider.value)
    //
    //
    //
    //        let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
    //
    //
    //
    //        player!.seek(to: targetTime)
    //
    //
    //
    //        if player!.rate == 0 {
    //
    //
    //print("playerplayerplayerplayer")
    //            player?.play()
    //
    //
    //
    //        }
    //
    //
    //        else {
    //
    //
    //          print("stopsssssss")
    //
    //            player?.pause()
    //        }
    //
    //    }
    //
      
    }

    
    
    
    


    
    
    
    
    

